import 'package:instock/domain/models/app_locale_option.dart';

abstract interface class LocalePreferencesRepository {
  Future<AppLocaleOption?> readSelectedLocale();

  Future<void> writeSelectedLocale(AppLocaleOption option);
}
