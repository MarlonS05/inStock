/// Preset theme identifiers. Every variant must be named after a cocktail.
enum ThemePresetId {
  cosmopolitan,
  pinaColada,
  whiteRussian,
  chartreuse,
  blueHawaii,
  oldFashioned;

  bool get isDarkCategory => switch (this) {
        ThemePresetId.chartreuse ||
        ThemePresetId.blueHawaii ||
        ThemePresetId.oldFashioned =>
          true,
        _ => false,
      };

  static ThemePresetId? fromStorageKey(String? key) {
    if (key == null) {
      return null;
    }

    final migrated = _legacyStorageKeys[key];
    final resolvedKey = migrated ?? key;
    return ThemePresetId.values.asNameMap()[resolvedKey];
  }

  /// Maps retired preset storage keys to the current default.
  static const _legacyStorageKeys = <String, String>{
    'mojito': 'cosmopolitan',
    'blueLagoon': 'cosmopolitan',
    'grasshopper': 'cosmopolitan',
    'darkAndStormy': 'cosmopolitan',
    'manhattan': 'cosmopolitan',
    'aviation': 'cosmopolitan',
    'tealLight': 'cosmopolitan',
    'blueLight': 'cosmopolitan',
    'greenLight': 'cosmopolitan',
    'tealDark': 'cosmopolitan',
    'slateDark': 'cosmopolitan',
    'indigoDark': 'cosmopolitan',
    'midoriSour': 'chartreuse',
  };
}
