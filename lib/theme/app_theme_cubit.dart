import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/models/theme_preset_id.dart';
import 'package:instock/domain/repositories/theme_preferences_repository.dart';
import 'package:instock/theme/app_theme_presets.dart';
import 'package:instock/theme/app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit(this._repository)
      : super(
          AppThemeState(
            preset: defaultThemePreset,
            themeData: themeDataForPreset(defaultThemePreset),
          ),
        );

  final ThemePreferencesRepository _repository;

  Future<void> load() async {
    final saved = await _repository.readSelectedPreset();
    final preset = saved ?? defaultThemePreset;
    emit(AppThemeState(preset: preset, themeData: themeDataForPreset(preset)));
  }

  Future<void> selectPreset(ThemePresetId preset) async {
    await _repository.writeSelectedPreset(preset);
    emit(AppThemeState(preset: preset, themeData: themeDataForPreset(preset)));
  }
}
