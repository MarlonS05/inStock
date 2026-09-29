import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/repositories/preset_repository.dart';
import 'package:instock/domain/use_cases/preset/create_or_update_preset_use_case.dart';
import 'package:instock/domain/use_cases/preset/delete_preset_use_case.dart';
import 'package:instock/screens/products/products/products_bloc.dart';
import 'package:instock/screens/products/products/products_event.dart';
import 'package:instock/screens/products/products/products_state.dart';

void main() {
  group('ProductsBloc', () {
    late _FakePresetRepository presetRepository;
    late ProductsBloc bloc;

    setUp(() {
      presetRepository = _FakePresetRepository();
      bloc = ProductsBloc(
        presetRepository,
        CreateOrUpdatePresetUseCase(presetRepository),
        DeletePresetUseCase(presetRepository),
      );
    });

    tearDown(() async {
      await bloc.close();
    });

    test('started loads presets with bulk material counts', () async {
      presetRepository.presets.addAll([
        const Preset(
          id: 'p2',
          name: 'Table',
          description: '',
        ),
        const Preset(
          id: 'p1',
          name: 'Shelf',
          description: '',
        ),
      ]);
      presetRepository.countsByPresetId
        ..['p1'] = 3
        ..['p2'] = 1;

      final loaded = bloc.stream.firstWhere(
        (s) => s.status == ProductsStatus.loaded,
      );
      bloc.add(const ProductsEvent.started());
      final state = await loaded;

      expect(
        state.items.map((item) => item.preset.name).toList(),
        ['Shelf', 'Table'],
      );
      expect(state.items.first.materialCount, 3);
      expect(state.items.last.materialCount, 1);
      expect(presetRepository.bulkCountCalls, 1);
      expect(presetRepository.getMaterialsCalls, 0);
    });
  });
}

class _FakePresetRepository implements PresetRepository {
  final presets = <Preset>[];
  final countsByPresetId = <String, int>{};
  final materialsByPresetId = <String, List<PresetMaterial>>{};
  var bulkCountCalls = 0;
  var getMaterialsCalls = 0;

  @override
  Future<List<Preset>> getAll() async => List.of(presets);

  @override
  Future<Preset?> getById(String id) async {
    for (final preset in presets) {
      if (preset.id == id) {
        return preset;
      }
    }
    return null;
  }

  @override
  Future<List<PresetMaterial>> getMaterials(String presetId) async {
    getMaterialsCalls++;
    return List.of(materialsByPresetId[presetId] ?? const []);
  }

  @override
  Future<Map<String, int>> getMaterialCountsByPresetId() async {
    bulkCountCalls++;
    return Map.of(countsByPresetId);
  }

  @override
  Future<void> save(Preset preset) async {
    presets
      ..removeWhere((item) => item.id == preset.id)
      ..add(preset);
  }

  @override
  Future<void> delete(String id) async {
    presets.removeWhere((item) => item.id == id);
    countsByPresetId.remove(id);
    materialsByPresetId.remove(id);
  }

  @override
  Future<void> saveMaterial(PresetMaterial line) async {
    final lines = materialsByPresetId.putIfAbsent(line.presetId, () => []);
    lines
      ..removeWhere((item) => item.id == line.id)
      ..add(line);
  }

  @override
  Future<void> deleteMaterial(String id) async {
    for (final lines in materialsByPresetId.values) {
      lines.removeWhere((item) => item.id == id);
    }
  }
}
