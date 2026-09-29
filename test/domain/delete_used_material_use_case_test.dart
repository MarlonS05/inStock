import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/domain/use_cases/product/delete_used_material_use_case.dart';

void main() {
  group('DeleteUsedMaterialUseCase', () {
    late _FakeProductRepository repository;
    late DeleteUsedMaterialUseCase useCase;

    setUp(() {
      repository = _FakeProductRepository();
      useCase = DeleteUsedMaterialUseCase(repository);
    });

    test('delegates delete to the product repository', () async {
      await useCase('um-1');

      expect(repository.deletedIds, ['um-1']);
    });
  });
}

class _FakeProductRepository implements ProductRepository {
  final deletedIds = <String>[];

  @override
  Future<void> deleteUsedMaterial(String id) async {
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
  Future<void> delete(String id) async {}

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
