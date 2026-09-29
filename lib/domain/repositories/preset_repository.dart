import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';

abstract interface class PresetRepository {
  Future<List<Preset>> getAll();

  Future<Preset?> getById(String id);

  Future<List<PresetMaterial>> getMaterials(String presetId);

  /// BOM line counts keyed by preset_id.
  Future<Map<String, int>> getMaterialCountsByPresetId();

  Future<void> save(Preset preset);

  Future<void> delete(String id);

  Future<void> saveMaterial(PresetMaterial line);

  Future<void> deleteMaterial(String id);
}
