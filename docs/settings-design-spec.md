# Settings (theme & locale) — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: settings
  product_name: inStock
  source: N/A (docs catch-up from lib/)
  target_platform: Flutter (iOS / Android)
  status: shipped
-->

> **Purpose:** Machine-readable design spec for settings, theme presets, locale,
> and developer seed as implemented.
> **Audience:** Coding agents and contributors. Follow `AGENTS.md` and
> `docs/architecture.md` before writing code.

---

## Document map

| § | Section |
|---|---------|
| 0 | [Repo conventions](#0-repo-conventions) |
| 1 | [Feature overview](#1-feature-overview) |
| 2 | [Data model](#2-data-model) |
| 3 | [Component reuse](#3-component-reuse) |
| 4 | [Screens](#4-screens) |
| 5 | [Navigation & state](#5-navigation--state) |
| 6 | [Interaction & tokens](#6-interaction--tokens) |
| 7 | [Out of scope](#7-out-of-scope) |
| A | [Implementation checklist](#appendix-a-implementation-checklist) |

---

## 0. Repo conventions

| Rule | This feature |
|------|--------------|
| BLoC + Freezed codegen | `SettingsBloc` (seed + wipe); theme/locale via `AppThemeCubit` / `AppLocaleCubit` |
| All screens registered in `lib/router/` / `appRouter` | Shell tab `/settings` |
| All navigation in BLoCs | No leave-screen navigation |
| Widget classes | Private panels in `settings_view.dart` |
| Infra I/O | `ThemePreferencesRepository`, `LocalePreferencesRepository` (platform / shared_preferences) |
| Persistence | Preference repos + `SeedDatabaseUseCase` / `WipeDatabaseUseCase` |
| Writes | `SeedDatabaseUseCase` under `domain/use_cases/seed/`; `WipeDatabaseUseCase` under `domain/use_cases/database/`; theme/locale via cubits → preference repos |
| Errors | `UiErrorCodes.seedFailure` / `wipeFailure` + snackbars |
| Theme | Selecting a preset updates `MaterialApp.theme` via `AppThemeCubit` |

**Replaces:** N/A.

**Reference implementations:** `lib/screens/settings/settings/`, `lib/theme/`.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Settings | `/settings` (shell tab) | Localized settings title |

Entry: bottom nav tab (index 4).

### 1.2 Flows

- **Language:** `LanguageCycleBox` → `AppLocaleCubit.cycleLocale()` toggles `english` ↔ `german`, persisted.
- **Theme:** `ThemePickerPanel` lists light/dark cocktail presets → `AppThemeCubit.selectPreset`, persisted. System dark mode ignored; dark UI requires a dark-category preset.
- **Seed database (developer):** Button → `SettingsSeedDatabaseRequested` → `SeedDatabaseUseCase` (clear inventory tables, insert dummy materials/presets/BOM, add one workbench build via `AddProductToWorkbenchUseCase`). Disabled while `SettingsStatus.seeding` or `wiping`.
- **Wipe database (developer):** Button → Home-style confirm dialog → `SettingsWipeDatabaseRequested` → `WipeDatabaseUseCase` (`wipeAndRecreate`). Disabled while `SettingsStatus.seeding` or `wiping`.
- **Back:** N/A (shell tab).

---

## 2. Data model

```dart
enum ThemePresetId {
  cosmopolitan,   // light — default
  pinaColada,     // light
  whiteRussian,   // light
  chartreuse,     // dark
  blueHawaii,     // dark
  oldFashioned,   // dark
}

enum AppLocaleOption { english, german } // legacy `system` → english

// Seed: domain/seed/dummy_seed_data.dart + DatabaseSeederRepository
```

| Value | Label | Notes |
|-------|-------|-------|
| Default theme | `cosmopolitan` | Hand-authored ColorScheme in `app_theme_presets.dart` |
| Locales | en / de | `AppLocaleCubit` → `MaterialApp.locale` |

**Persistence:**

| Op | Layer |
|----|-------|
| Theme preference | `ThemePreferencesRepository` → `ThemePreferencesRepositoryImpl` |
| Locale preference | `LocalePreferencesRepository` → `LocalePreferencesRepositoryImpl` |
| Seed | `SeedDatabaseUseCase` → `DatabaseSeederRepository` |

No inventory tables owned solely by settings except via seed.

---

## 3. Component reuse

### 3.1 Reuse as-is
`AppSurface` for panel chrome.

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
Inventory/product list cards for theme swatches — settings uses its own picker UI.

### 3.4 Build new
`LanguageCycleBox`, `ThemePickerPanel`, developer seed panel as private widgets in `settings_view.dart`.

---

## 4. Screens

```yaml
route: /settings
folder: lib/screens/settings/settings/
bloc: SettingsBloc
view: SettingsView
# also: AppThemeCubit, AppLocaleCubit (lib/theme/, DI singletons)
```

```
AppShell (tab)
└── SettingsView
    ├── AppBar
    ├── LanguageCycleBox → AppLocaleCubit.cycleLocale
    ├── ThemePickerPanel
    │   ├── Light: cosmopolitan, pinaColada, whiteRussian
    │   └── Dark: chartreuse, blueHawaii, oldFashioned
    └── Developer: Seed + Wipe database buttons → SettingsBloc events
```

**Selection / actions:** Theme/locale call cubits directly from the view (not SettingsBloc events). Seed and wipe go through SettingsBloc.

**States & styling:** `SettingsStatus.seeding` / `wiping` disables both developer controls; success/failure snackbars via l10n keyed by `lastAction`; `seedFailure` / `wipeFailure` codes on error.

---

## 5. Navigation & state

### Routes

```dart
'/settings' // shell tab
```

### BLoC / cubit API

**SettingsBloc:** `SettingsSeedDatabaseRequested`, `SettingsWipeDatabaseRequested`.

**AppThemeCubit:** `load`, `selectPreset(ThemePresetId)`.

**AppLocaleCubit:** `load`, `cycleLocale()` (`AppLocaleOption.next`).

---

## 6. Interaction & tokens

- Preset colors from `lib/theme/app_theme_presets.dart` (not `ColorScheme.fromSeed`).
- Shared tokens: `AppSpacing`, `AppRadius`.
- `BlocListener` for seed/wipe errors/success.

---

## 7. Out of scope

- System / follow-device locale or theme.
- Account / cloud sync / HTTP.
- Extra locales beyond en/de.
- Non-cocktail theme IDs (architecture forbids).

---

## Appendix A. Implementation checklist

```
[x] ThemePresetId + AppLocaleOption + preference repos/impls
[x] AppThemeCubit + AppLocaleCubit + presets ThemeData
[x] SettingsBloc + SettingsView (seed + wipe + panels)
[x] Route + DI wiring (settings screens, app preferences)
[x] Verify: flutter analyze + flutter test
```
