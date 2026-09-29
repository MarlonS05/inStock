import 'package:instock/domain/models/theme_preset_id.dart';
import 'package:instock/domain/repositories/theme_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferencesRepositoryImpl implements ThemePreferencesRepository {
  static const _key = 'selected_theme_preset';

  @override
  Future<ThemePresetId?> readSelectedPreset() async {
    final prefs = await SharedPreferences.getInstance();
    return ThemePresetId.fromStorageKey(prefs.getString(_key));
  }

  @override
  Future<void> writeSelectedPreset(ThemePresetId preset) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, preset.name);
  }
}
