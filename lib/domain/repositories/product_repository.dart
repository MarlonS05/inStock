import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';

abstract interface class ProductRepository {
  Future<List<Product>> getAll();

  Future<List<Product>> getByState(ProductState state);

  Future<Product?> getById(String id);

  Future<List<Product>> getFinishedBetween({
    required DateTime startInclusive,
    required DateTime endInclusive,
  });

  Future<List<UsedMaterial>> getUsedMaterials(String productId);

  /// Used-material lines keyed by product_id for the given products.
  Future<Map<String, List<UsedMaterial>>> getUsedMaterialsByProductId(
    List<String> productIds,
  );

  Future<void> save(Product product);

  Future<void> saveUsedMaterial(UsedMaterial usedMaterial);

  Future<void> deleteUsedMaterial(String id);

  /// Deletes the product. Used-material rows cascade away, releasing
  /// reservations without changing on-hand inventory.
  Future<void> delete(String id);

  /// Snapshot preset BOM and persist a workbench build with reservations.
  Future<Product> addToWorkbench({
    required Preset preset,
    required List<PresetMaterial> bom,
    required String customer,
  });

  /// Subtract reserved quantities from inventory, delete used-material rows,
  /// and mark the build finished.
  Future<void> finish(String productId);
}
