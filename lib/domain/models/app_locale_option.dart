/// User-selectable app locale.
enum AppLocaleOption {
  english,
  german;

  String get languageCode => switch (this) {
        AppLocaleOption.english => 'en',
        AppLocaleOption.german => 'de',
      };

  AppLocaleOption get next => switch (this) {
        AppLocaleOption.english => AppLocaleOption.german,
        AppLocaleOption.german => AppLocaleOption.english,
      };

  static AppLocaleOption? fromStorageKey(String? key) {
    if (key == null) {
      return null;
    }
    if (key == 'system') {
      return AppLocaleOption.english;
    }
    return AppLocaleOption.values.asNameMap()[key];
  }
}
