import 'package:instock/domain/models/theme_preset_id.dart';

abstract interface class ThemePreferencesRepository {
  Future<ThemePresetId?> readSelectedPreset();

  Future<void> writeSelectedPreset(ThemePresetId preset);
}
