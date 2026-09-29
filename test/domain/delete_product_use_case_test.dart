import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/domain/use_cases/product/delete_product_use_case.dart';

void main() {
  group('DeleteProductUseCase', () {
    late _FakeProductRepository repository;
    late DeleteProductUseCase useCase;

    setUp(() {
      repository = _FakeProductRepository();
      useCase = DeleteProductUseCase(repository);
    });

    test('delegates delete to the product repository', () async {
      await useCase('prod-1');

      expect(repository.deletedIds, ['prod-1']);
    });

    test('propagates repository failures', () async {
      repository.failDelete = true;

      expect(() => useCase('prod-1'), throwsStateError);
    });
  });
}

class _FakeProductRepository implements ProductRepository {
  final deletedIds = <String>[];
  var failDelete = false;

  @override
  Future<void> delete(String id) async {
    if (failDelete) {
      throw StateError('cannot delete $id');
    }
    deletedIds.add(id);
  }

  @override
  Future<Product> addToWorkbench({
    required Preset preset,
    required List<PresetMaterial> bom,
    required String customer,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUsedMaterial(String id) async {}

  @override
  Future<void> finish(String productId) async {}

  @override
  Future<List<Product>> getAll() async => [];

  @override
  Future<Product?> getById(String id) async => null;

  @override
  Future<List<Product>> getByState(ProductState state) async => [];

  @override
  Future<List<Product>> getFinishedBetween({
    required DateTime startInclusive,
    required DateTime endInclusive,
  }) async =>
      [];

  @override
  Future<List<UsedMaterial>> getUsedMaterials(String productId) async => [];

  @override
  Future<Map<String, List<UsedMaterial>>> getUsedMaterialsByProductId(
    List<String> productIds,
  ) async =>
      {for (final id in productIds) id: <UsedMaterial>[]};

  @override
  Future<void> save(Product product) async {}

  @override
  Future<void> saveUsedMaterial(UsedMaterial usedMaterial) async {}
}
