import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/use_cases/material/add_material_stock_use_case.dart';

void main() {
  group('AddMaterialStockUseCase', () {
    late _FakeMaterialRepository repository;
    late AddMaterialStockUseCase useCase;

    setUp(() {
      repository = _FakeMaterialRepository();
      useCase = AddMaterialStockUseCase(repository);
    });

    test('adds quantity to on-hand stock', () async {
      repository.materials['mat-1'] = const Material(
        id: 'mat-1',
        title: 'Oak',
        description: '',
        quantity: 2,
      );

      await useCase(materialId: 'mat-1', quantity: 3.5);

      expect(repository.materials['mat-1']!.quantity, 5.5);
    });

    test('rejects non-positive quantity', () async {
      repository.materials['mat-1'] = const Material(
        id: 'mat-1',
        title: 'Oak',
        description: '',
        quantity: 2,
      );

      expect(
        () => useCase(materialId: 'mat-1', quantity: 0),
        throwsArgumentError,
      );
    });

    test('throws when material is missing', () async {
      expect(
        () => useCase(materialId: 'missing', quantity: 1),
        throwsStateError,
      );
    });
  });
}

class _FakeMaterialRepository implements MaterialRepository {
  final materials = <String, Material>{};

  @override
  Future<void> delete(String id) async {
    materials.remove(id);
  }

  @override
  Future<List<Material>> getAll() async => materials.values.toList();

  @override
  Future<double> getAvailableQuantity(String materialId) async {
    return materials[materialId]?.quantity ?? 0;
  }

  @override
  Future<Material?> getById(String id) async => materials[id];

  @override
  Future<double> getReservedQuantity(String materialId) async => 0;

  @override
  Future<Map<String, double>> getReservedQuantitiesByMaterialId() async => {};

  @override
  Future<void> save(Material material) async {
    materials[material.id] = material;
  }
}
