import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';

/// Whether [preset] still matches create-time defaults (no user edits).
bool isUntouchedPresetDraft({
  required Preset preset,
  required Iterable<PresetMaterial> bomLines,
  required String defaultName,
}) {
  return preset.name == defaultName &&
      preset.description.isEmpty &&
      preset.image == null &&
      bomLines.isEmpty;
}
