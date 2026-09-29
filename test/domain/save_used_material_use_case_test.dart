import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/domain/use_cases/product/save_used_material_use_case.dart';

void main() {
  late _FakeProductRepository productRepository;
  late SaveUsedMaterialUseCase useCase;

  setUp(() {
    productRepository = _FakeProductRepository();
    useCase = SaveUsedMaterialUseCase(productRepository);
  });

  test('saves a new line', () async {
    const line = UsedMaterial(
      id: 'um-1',
      productId: 'prod-1',
      materialId: 'mat-1',
      quantity: 3,
    );

    await useCase(line);

    expect(productRepository.saved, [line]);
  });

  test('allows a quantity above available stock', () async {
    const line = UsedMaterial(
      id: 'um-1',
      productId: 'prod-1',
      materialId: 'mat-1',
      quantity: 100,
    );

    await useCase(line);

    expect(productRepository.saved, [line]);
  });

  test('persists an updated quantity', () async {
    const line = UsedMaterial(
      id: 'um-1',
      productId: 'prod-1',
      materialId: 'mat-1',
      quantity: 7,
    );

    await useCase(line);

    expect(productRepository.saved, [line]);
  });
}

class _FakeProductRepository implements ProductRepository {
  final saved = <UsedMaterial>[];

  @override
  Future<void> saveUsedMaterial(UsedMaterial usedMaterial) async {
    saved.add(usedMaterial);
  }

  @override
  Future<void> deleteUsedMaterial(String id) async {}

  @override
  Future<List<Product>> getAll() async => [];

  @override
  Future<List<Product>> getByState(ProductState state) async => [];

  @override
  Future<Product?> getById(String id) async => null;

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
  Future<void> delete(String id) async {}

  @override
  Future<Product> addToWorkbench({
    required Preset preset,
    required List<PresetMaterial> bom,
    required String customer,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> finish(String productId) async {}
}
