import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/screens/workshop/workshop/workshop_bloc.dart';
import 'package:instock/screens/workshop/workshop/workshop_event.dart';
import 'package:instock/screens/workshop/workshop/workshop_state.dart';

void main() {
  group('WorkshopBloc', () {
    late _FakeProductRepository productRepository;
    late _FakeMaterialRepository materialRepository;
    late WorkshopBloc bloc;

    setUp(() {
      productRepository = _FakeProductRepository();
      materialRepository = _FakeMaterialRepository();
      bloc = WorkshopBloc(productRepository, materialRepository);
    });

    tearDown(() async {
      await bloc.close();
    });

    test('started loads projects with one bulk used-material and reserved read',
        () async {
      productRepository.products.addAll([
        Product(
          id: 'prod-1',
          state: ProductState.workbench,
          presetId: 'preset-1',
          presetName: 'Shelf',
          presetDescription: 'Wall shelf',
          customer: 'Alex',
          updatedAt: DateTime(2026, 7, 21),
        ),
        Product(
          id: 'prod-2',
          state: ProductState.workbench,
          presetId: 'preset-2',
          presetName: 'Box',
          presetDescription: 'Small box',
          customer: 'Sam',
          updatedAt: DateTime(2026, 7, 20),
        ),
      ]);
      productRepository.usedMaterials.addAll([
        const UsedMaterial(
          id: 'u1',
          productId: 'prod-1',
          materialId: 'mat-oak',
          quantity: 2,
        ),
        const UsedMaterial(
          id: 'u2',
          productId: 'prod-2',
          materialId: 'mat-oak',
          quantity: 3,
        ),
        const UsedMaterial(
          id: 'u3',
          productId: 'prod-2',
          materialId: 'mat-pine',
          quantity: 1,
        ),
      ]);
      materialRepository.materials.addAll([
        const Material(
          id: 'mat-oak',
          title: 'Oak',
          description: '',
          quantity: 4,
        ),
        const Material(
          id: 'mat-pine',
          title: 'Pine',
          description: '',
          quantity: 5,
        ),
      ]);
      materialRepository.reservedById
        ..['mat-oak'] = 5
        ..['mat-pine'] = 1;

      final loaded = bloc.stream.firstWhere(
        (s) => s.status == WorkshopStatus.loaded,
      );
      bloc.add(const WorkshopEvent.started());
      final state = await loaded;

      expect(state.projects, hasLength(2));
      expect(state.projects.map((p) => p.product.id).toList(), [
        'prod-2',
        'prod-1',
      ]);
      expect(
        state.projects.map((p) => p.hasMaterialShortage).toList(),
        [true, true],
      );
      expect(productRepository.usedMaterialsByProductIdCalls, 1);
      expect(productRepository.getUsedMaterialsCalls, 0);
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
  final products = <Product>[];
  final usedMaterials = <UsedMaterial>[];
  var usedMaterialsByProductIdCalls = 0;
  var getUsedMaterialsCalls = 0;

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
  Future<List<Product>> getAll() async => List.of(products);

  @override
  Future<Product?> getById(String id) async {
    for (final product in products) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  @override
  Future<List<Product>> getByState(ProductState state) async =>
      products.where((product) => product.state == state).toList();

  @override
  Future<List<Product>> getFinishedBetween({
    required DateTime startInclusive,
    required DateTime endInclusive,
  }) async =>
      [];

  @override
  Future<List<UsedMaterial>> getUsedMaterials(String productId) async {
    getUsedMaterialsCalls++;
    return usedMaterials.where((line) => line.productId == productId).toList();
  }

  @override
  Future<Map<String, List<UsedMaterial>>> getUsedMaterialsByProductId(
    List<String> productIds,
  ) async {
    usedMaterialsByProductIdCalls++;
    return {
      for (final id in productIds)
        id: usedMaterials.where((line) => line.productId == id).toList(),
    };
  }

  @override
  Future<void> save(Product product) async {
    products
      ..removeWhere((existing) => existing.id == product.id)
      ..add(product);
  }

  @override
  Future<void> saveUsedMaterial(UsedMaterial usedMaterial) async {
    usedMaterials
      ..removeWhere((line) => line.id == usedMaterial.id)
      ..add(usedMaterial);
  }
}
