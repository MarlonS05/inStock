import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/services/material_image_service.dart';
import 'package:instock/domain/use_cases/material/create_or_update_material_use_case.dart';
import 'package:instock/domain/use_cases/material/delete_material_use_case.dart';
import 'package:instock/domain/use_cases/material/update_material_image_use_case.dart';
import 'package:instock/screens/inventory/inventory/inventory_bloc.dart';
import 'package:instock/screens/inventory/inventory/inventory_event.dart';
import 'package:instock/screens/inventory/inventory/inventory_state.dart';

void main() {
  group('InventoryBloc', () {
    late _FakeMaterialRepository materialRepository;
    late InventoryBloc bloc;

    setUp(() {
      materialRepository = _FakeMaterialRepository();
      final imageService = _FakeMaterialImageService();
      bloc = InventoryBloc(
        materialRepository,
        CreateOrUpdateMaterialUseCase(materialRepository),
        DeleteMaterialUseCase(materialRepository),
        UpdateMaterialImageUseCase(imageService, materialRepository),
        imageService,
      );
    });

    tearDown(() async {
      await bloc.close();
    });

    test('started loads materials sorted by title', () async {
      materialRepository.materials.addAll([
        const Material(
          id: 'm2',
          title: 'Walnut',
          description: '',
          quantity: 1,
        ),
        const Material(
          id: 'm1',
          title: 'Ash',
          description: '',
          quantity: 2,
        ),
      ]);

      final loaded = bloc.stream.firstWhere(
        (s) => s.status == InventoryStatus.loaded,
      );
      bloc.add(const InventoryEvent.started());
      final state = await loaded;

      expect(
        state.items.map((item) => item.material.title).toList(),
        ['Ash', 'Walnut'],
      );
      expect(materialRepository.bulkReservedCalls, 1);
      expect(materialRepository.availableCalls, 0);
    });

    test('searchChanged filters visible items', () async {
      materialRepository.materials.addAll([
        const Material(
          id: 'm1',
          title: 'Oak plank',
          description: 'hardwood',
          quantity: 1,
        ),
        const Material(
          id: 'm2',
          title: 'Pine',
          description: 'softwood',
          quantity: 1,
        ),
      ]);

      final started = bloc.stream.firstWhere(
        (state) => state.status == InventoryStatus.loaded,
      );
      bloc.add(const InventoryEvent.started());
      await started;

      final searched =
          bloc.stream.firstWhere((state) => state.searchQuery == 'oak');
      bloc.add(const InventoryEvent.searchChanged('oak'));
      await searched;

      expect(bloc.state.visibleItems.single.material.id, 'm1');
    });

    test('materialSaved persists a new material and reloads', () async {
      final saved = bloc.stream.firstWhere(
        (s) =>
            s.status == InventoryStatus.loaded &&
            s.items.length == 1 &&
            s.items.single.material.title == 'Birch',
      );
      bloc.add(
        const InventoryEvent.materialSaved(
          title: 'Birch',
          description: 'light wood',
          quantity: 4,
        ),
      );
      final state = await saved;

      expect(state.items.single.material.quantity, 4);
      expect(materialRepository.bulkReservedCalls, 1);
      expect(materialRepository.availableCalls, 0);
    });
  });
}

class _FakeMaterialRepository implements MaterialRepository {
  final materials = <Material>[];
  final reservedById = <String, double>{};
  var bulkReservedCalls = 0;
  var availableCalls = 0;

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
    availableCalls++;
    final material = await getById(materialId);
    return (material?.quantity ?? 0) - (reservedById[materialId] ?? 0);
  }

  @override
  Future<double> getReservedQuantity(String materialId) async =>
      reservedById[materialId] ?? 0;

  @override
  Future<Map<String, double>> getReservedQuantitiesByMaterialId() async {
    bulkReservedCalls++;
    return Map.of(reservedById);
  }

  @override
  Future<void> save(Material material) async {
    materials
      ..removeWhere((item) => item.id == material.id)
      ..add(material);
  }

  @override
  Future<void> delete(String id) async {
    materials.removeWhere((item) => item.id == id);
  }
}

class _FakeMaterialImageService implements MaterialImageService {
  @override
  Future<Uint8List?> pickImageBytes() async => null;

  @override
  Future<String> saveMaterialImageBytes(
    String materialId,
    Uint8List bytes,
  ) async =>
      '/tmp/$materialId.png';
}
