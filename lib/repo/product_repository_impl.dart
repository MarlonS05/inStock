import 'package:instock/db/app_database.dart';
import 'package:instock/db/daos/material_dao.dart';
import 'package:instock/db/daos/product_dao.dart';
import 'package:instock/db/daos/used_material_dao.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:uuid/uuid.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(
    this._database,
    this._productDao,
    this._usedMaterialDao,
    this._materialDao,
  );

  final AppDatabase _database;
  final ProductDao _productDao;
  final UsedMaterialDao _usedMaterialDao;
  final MaterialDao _materialDao;
  final _uuid = const Uuid();

  @override
  Future<List<Product>> getAll() => _productDao.findAll();

  @override
  Future<List<Product>> getByState(ProductState state) =>
      _productDao.findByState(state);

  @override
  Future<Product?> getById(String id) => _productDao.findById(id);

  @override
  Future<List<Product>> getFinishedBetween({
    required DateTime startInclusive,
    required DateTime endInclusive,
  }) =>
      _productDao.findFinishedUpdatedBetween(
        startInclusive: startInclusive,
        endInclusive: endInclusive,
      );

  @override
  Future<List<UsedMaterial>> getUsedMaterials(String productId) =>
      _usedMaterialDao.findByProductId(productId);

  @override
  Future<Map<String, List<UsedMaterial>>> getUsedMaterialsByProductId(
    List<String> productIds,
  ) async {
    final rows = await _usedMaterialDao.findByProductIds(productIds);
    final byProductId = <String, List<UsedMaterial>>{
      for (final id in productIds) id: <UsedMaterial>[],
    };
    for (final row in rows) {
      byProductId.putIfAbsent(row.productId, () => <UsedMaterial>[]).add(row);
    }
    return byProductId;
  }

  @override
  Future<void> save(Product product) =>
      _productDao.upsert(product.copyWith(updatedAt: DateTime.now()));

  @override
  Future<void> saveUsedMaterial(UsedMaterial usedMaterial) =>
      _usedMaterialDao.upsert(usedMaterial);

  @override
  Future<void> deleteUsedMaterial(String id) =>
      _usedMaterialDao.deleteById(id);

  @override
  Future<void> delete(String id) => _productDao.deleteById(id);

  @override
  Future<Product> addToWorkbench({
    required Preset preset,
    required List<PresetMaterial> bom,
    required String customer,
  }) async {
    final productId = _uuid.v4();
    final now = DateTime.now();
    final product = Product.fromPreset(
      id: productId,
      state: ProductState.workbench,
      source: preset,
      customer: customer,
      updatedAt: now,
    );

    final usedMaterials = bom
        .map(
          (line) => UsedMaterial.fromPresetMaterial(
            id: _uuid.v4(),
            productId: productId,
            source: line,
          ),
        )
        .toList();

    await _database.transaction((txn) async {
      await _productDao.upsert(product, db: txn);
      for (final usedMaterial in usedMaterials) {
        await _usedMaterialDao.upsert(usedMaterial, db: txn);
      }
    });

    return product;
  }

  @override
  Future<void> finish(String productId) async {
    final product = await _productDao.findById(productId);
    if (product == null) {
      throw StateError('Product not found: $productId');
    }
    if (product.state == ProductState.finished) {
      return;
    }

    final usedMaterials = await _usedMaterialDao.findByProductId(productId);

    await _database.transaction((txn) async {
      for (final usedMaterial in usedMaterials) {
        final material =
            await _materialDao.findById(usedMaterial.materialId, db: txn);
        if (material == null) {
          throw StateError(
            'Material not found: ${usedMaterial.materialId}',
          );
        }
        await _materialDao.upsert(
          material.copyWith(
            quantity: material.quantity - usedMaterial.quantity,
          ),
          db: txn,
        );
      }

      await _productDao.upsert(
        product.copyWith(
          state: ProductState.finished,
          updatedAt: DateTime.now(),
        ),
        db: txn,
      );

      await _usedMaterialDao.deleteByProductId(productId, db: txn);
    });
  }
}
