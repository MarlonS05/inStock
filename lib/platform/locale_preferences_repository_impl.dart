import 'package:instock/domain/models/app_locale_option.dart';
import 'package:instock/domain/repositories/locale_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalePreferencesRepositoryImpl implements LocalePreferencesRepository {
  static const _key = 'selected_locale';

  @override
  Future<AppLocaleOption?> readSelectedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    return AppLocaleOption.fromStorageKey(prefs.getString(_key));
  }

  @override
  Future<void> writeSelectedLocale(AppLocaleOption option) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, option.name);
  }
}
