import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/domain/use_cases/product/delete_product_use_case.dart';
import 'package:instock/domain/use_cases/product/delete_used_material_use_case.dart';
import 'package:instock/domain/use_cases/product/finish_product_use_case.dart';
import 'package:instock/domain/use_cases/product/save_used_material_use_case.dart';
import 'package:instock/domain/use_cases/product/update_product_use_case.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_bloc.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_event.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_state.dart';

void main() {
  group('ProductDetailBloc', () {
    late _FakeProductRepository productRepository;
    late _FakeMaterialRepository materialRepository;
    late ProductDetailBloc bloc;

    setUp(() {
      productRepository = _FakeProductRepository();
      materialRepository = _FakeMaterialRepository();
      bloc = ProductDetailBloc(
        productRepository,
        materialRepository,
        UpdateProductUseCase(productRepository),
        SaveUsedMaterialUseCase(productRepository),
        DeleteUsedMaterialUseCase(productRepository),
        FinishProductUseCase(productRepository),
        DeleteProductUseCase(productRepository),
      );
    });

    tearDown(() async {
      await bloc.close();
    });

    test('started loads lines with one bulk reserved read', () async {
      productRepository.product = Product(
        id: 'prod-1',
        state: ProductState.workbench,
        presetId: 'preset-1',
        presetName: 'Shelf',
        presetDescription: 'Wall shelf',
        customer: 'Alex',
        updatedAt: DateTime(2026, 7, 21),
      );
      productRepository.usedMaterials.addAll([
        const UsedMaterial(
          id: 'u1',
          productId: 'prod-1',
          materialId: 'mat-oak',
          quantity: 2,
        ),
        const UsedMaterial(
          id: 'u2',
          productId: 'prod-1',
          materialId: 'mat-pine',
          quantity: 1,
        ),
      ]);
      materialRepository.materials.addAll([
        const Material(
          id: 'mat-oak',
          title: 'Oak',
          description: '',
          quantity: 10,
        ),
        const Material(
          id: 'mat-pine',
          title: 'Pine',
          description: '',
          quantity: 5,
        ),
      ]);
      materialRepository.reservedById
        ..['mat-oak'] = 4
        ..['mat-pine'] = 1;

      final loaded = bloc.stream.firstWhere(
        (s) => s.status == ProductDetailStatus.loaded,
      );
      bloc.add(const ProductDetailEvent.started('prod-1'));
      final state = await loaded;

      expect(state.materialLines, hasLength(2));
      expect(
        state.materialLines.map((line) => line.globalReservedQuantity).toList(),
        [4.0, 1.0],
      );
      expect(materialRepository.bulkReservedCalls, 1);
      expect(materialRepository.reservedCalls, 0);
    });
  });
}

class _FakeMaterialRepository implements MaterialRepository {
  final materials = <Material>[];
  final reservedById = <String, double>{};
  var bulkReservedCalls = 0;
  var reservedCalls = 0;

  @override
  Future<List<Material>> getAll() async => List.of(materials);

  @override
  Future<Material?> getById(String id) async {
    for (final material in materials) {
      if (material.id == id) {
        return material;
      }
    }
    return null;
  }

  @override
  Future<double> getAvailableQuantity(String materialId) async {
    final material = await getById(materialId);
    return (material?.quantity ?? 0) - (reservedById[materialId] ?? 0);
  }

  @override
  Future<double> getReservedQuantity(String materialId) async {
    reservedCalls++;
    return reservedById[materialId] ?? 0;
  }

  @override
  Future<Map<String, double>> getReservedQuantitiesByMaterialId() async {
    bulkReservedCalls++;
    return Map.of(reservedById);
  }

  @override
  Future<void> save(Material material) async {}

  @override
  Future<void> delete(String id) async {}
}

class _FakeProductRepository implements ProductRepository {
  Product? product;
  final usedMaterials = <UsedMaterial>[];

  @override
  Future<Product> addToWorkbench({
    required Preset preset,
    required List<PresetMaterial> bom,
    required String customer,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) async {}

  @override
  Future<void> deleteUsedMaterial(String id) async {}

  @override
  Future<void> finish(String productId) async {}

  @override
  Future<List<Product>> getAll() async =>
      product == null ? [] : [product!];

  @override
  Future<Product?> getById(String id) async =>
      product?.id == id ? product : null;

  @override
  Future<List<Product>> getByState(ProductState state) async =>
      product?.state == state ? [product!] : [];

  @override
  Future<List<Product>> getFinishedBetween({
    required DateTime startInclusive,
    required DateTime endInclusive,
  }) async =>
      [];

  @override
  Future<List<UsedMaterial>> getUsedMaterials(String productId) async =>
      usedMaterials.where((line) => line.productId == productId).toList();

  @override
  Future<Map<String, List<UsedMaterial>>> getUsedMaterialsByProductId(
    List<String> productIds,
  ) async {
    return {
      for (final id in productIds)
        id: usedMaterials.where((line) => line.productId == id).toList(),
    };
  }

  @override
  Future<void> save(Product product) async {
    this.product = product;
  }

  @override
  Future<void> saveUsedMaterial(UsedMaterial usedMaterial) async {
    usedMaterials
      ..removeWhere((line) => line.id == usedMaterial.id)
      ..add(usedMaterial);
  }
}
