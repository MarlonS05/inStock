import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/preset_repository.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/domain/use_cases/product/add_product_to_workbench_use_case.dart';

void main() {
  group('AddProductToWorkbenchUseCase', () {
    late _FakePresetRepository presetRepository;
    late _FakeProductRepository productRepository;
    late AddProductToWorkbenchUseCase useCase;

    const preset = Preset(
      id: 'preset-1',
      name: 'Cutting board',
      description: 'Oak board',
    );

    const bom = [
      PresetMaterial(
        id: 'pm-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 2,
      ),
      PresetMaterial(
        id: 'pm-2',
        materialId: 'mat-2',
        presetId: 'preset-1',
        quantity: 1,
      ),
    ];

    setUp(() {
      presetRepository = _FakePresetRepository(
        preset: preset,
        bom: bom,
      );
      productRepository = _FakeProductRepository();
      useCase = AddProductToWorkbenchUseCase(
        presetRepository,
        productRepository,
      );
    });

    test('adds a workbench product without checking available stock', () async {
      final product = await useCase(
        presetId: 'preset-1',
        customer: 'Ada',
      );

      expect(product.id, 'prod-1');
      expect(product.customer, 'Ada');
      expect(product.presetName, 'Cutting board');
      expect(productRepository.lastCustomer, 'Ada');
      expect(productRepository.lastBom, bom);
    });

    test('throws when the preset is missing', () async {
      expect(
        () => useCase(presetId: 'missing', customer: 'Ada'),
        throwsStateError,
      );
      expect(productRepository.addCalls, 0);
    });
  });
}

class _FakePresetRepository implements PresetRepository {
  _FakePresetRepository({
    required this.preset,
    required this.bom,
  });

  final Preset preset;
  final List<PresetMaterial> bom;

  @override
  Future<Preset?> getById(String id) async =>
      id == preset.id ? preset : null;

  @override
  Future<List<PresetMaterial>> getMaterials(String presetId) async =>
      presetId == preset.id ? bom : [];

  @override
  Future<Map<String, int>> getMaterialCountsByPresetId() async => {
        preset.id: bom.length,
      };

  @override
  Future<void> delete(String id) async {}

  @override
  Future<void> deleteMaterial(String id) async {}

  @override
  Future<List<Preset>> getAll() async => [preset];

  @override
  Future<void> save(Preset preset) async {}

  @override
  Future<void> saveMaterial(PresetMaterial line) async {}
}

class _FakeProductRepository implements ProductRepository {
  var addCalls = 0;
  String? lastCustomer;
  List<PresetMaterial>? lastBom;

  @override
  Future<Product> addToWorkbench({
    required Preset preset,
    required List<PresetMaterial> bom,
    required String customer,
  }) async {
    addCalls++;
    lastCustomer = customer;
    lastBom = bom;
    return Product.fromPreset(
      id: 'prod-1',
      state: ProductState.workbench,
      source: preset,
      customer: customer,
      updatedAt: DateTime(2026, 7, 21),
    );
  }

  @override
  Future<void> delete(String id) async {}

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
