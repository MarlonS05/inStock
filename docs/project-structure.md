# Project structure

Recommended folder scaffolding for inStock. The key idea: **one directory per
layer**, **one directory per screen** in presentation (BLoC + Freezed
event/state + UI together), a separate **lint_rules** package, and an
**architecture test** that guards the whole thing.

## Recommended tree

```
inStock/
├── AGENTS.md                         # terse agent rules
├── docs/
│   ├── architecture.md               # layers + strict import table
│   ├── agent-guidelines/             # Dart/Flutter practices
│   ├── product-overview.md
│   ├── design-spec.template.md       # copy → docs/<feature>-design-spec.md
│   ├── inventory-design-spec.md
│   ├── presets-design-spec.md
│   ├── workshop-design-spec.md
│   ├── archive-design-spec.md
│   └── settings-design-spec.md
├── lint_rules/                       # deny-list rules class
│   └── lib/
│       └── layer_import_rules.dart
├── lib/
│   ├── domain/                       # PURE: entities, models, repositories (interfaces),
│   │   ├── entities/                 #        services (ports), use_cases, formatters, validators
│   │   ├── models/
│   │   │   ├── theme_preset_id.dart  # cocktail-named theme IDs (pure Dart)
│   │   │   └── app_locale_option.dart
│   │   ├── repositories/             # interfaces only
│   │   ├── services/                 # ports (interfaces) to infra
│   │   ├── use_cases/                # one class per write/delete; grouped by entity/function
│   │   │   ├── material/
│   │   │   ├── product/
│   │   │   ├── preset/
│   │   │   ├── quote/
│   │   │   └── seed/
│   │   ├── formatters/
│   │   ├── validators/
│   │   └── seed/                     # dummy seed payloads (dev)
│   ├── repo/                         # repository implementations (fulfil domain interfaces)
│   ├── db/                           # persistence — connection, schema, migrations, DAOs
│   │   ├── app_database.dart         # open/close, version, transaction()
│   │   ├── schema/                   # CREATE TABLE DDL
│   │   ├── migrations/               # incremental upgrade steps
│   │   └── daos/                     # one DAO per table/aggregate — SQL CRUD
│   │       └── <entity>_dao.dart
│   ├── platform/                     # OS/plugin adapters implementing domain ports
│   ├── screens/                      # PRESENTATION — one directory per screen
│   │   ├── components/               # shared / reusable widgets only
│   │   │   ├── <widget>.dart
│   │   │   ├── preset/               # BOM / inline-edit shared widgets
│   │   │   └── search/
│   │   ├── home/home/
│   │   ├── inventory/inventory/
│   │   ├── products/
│   │   │   ├── products/
│   │   │   └── preset_detail/
│   │   ├── workshop/
│   │   │   ├── workshop/
│   │   │   └── product_detail/
│   │   ├── archive/archive/
│   │   ├── settings/settings/
│   │   ├── shell/app_shell/
│   │   └── errors/                   # UiErrorCodes (presentation helpers)
│   ├── router/                       # route table — register every screen here
│   ├── di/                           # dependency injection wiring
│   ├── theme/                        # design tokens, preset ThemeData, AppThemeCubit
│   │   ├── app_theme.dart            # AppSpacing, AppRadius
│   │   ├── app_theme_presets.dart    # preset → ThemeData mapping
│   │   ├── app_theme_cubit.dart
│   │   ├── app_theme_state.dart
│   │   ├── app_locale_cubit.dart
│   │   └── app_locale_state.dart
│   ├── l10n/                         # ARB translation files (app_<locale>.arb)
│   ├── logger/                       # shared Logger instance
│   │   └── logger.dart
│   └── main.dart
└── test/
    └── architecture/
        └── layer_import_test.dart
```

## Folder purposes

| Folder | Contains | Never contains |
|--------|----------|----------------|
| `domain/` | Pure business types, interfaces, use cases | Framework, UI, DB, platform imports |
| `repo/` | Repository implementations | UI, routing, DI, state-mgmt |
| `db/` | `AppDatabase`, schema, migrations, DAOs | UI, repo, routing, DI |
| `platform/` | Adapters for OS/plugins (implement domain ports) | UI, repo, db, routing, DI |
| `screens/<feature>/<screen>/` | One screen’s view + BLoC + Freezed event/state (+ generated); private Widget classes may live in `*_view.*` | Separate widget *files*; other screens; data-access / navigation packages |
| `screens/components/` | Shared / reusable UI widgets (subdirs OK) | Data-access, routing, DI, state-mgmt; screen BLoC/view files |
| `router/` | Route table — every screen registered here; supplies tab BLoC factories to the shell | Business logic; ad-hoc unregistered routes |
| `di/`, `theme/`, `l10n/`, `logger/` | Cross-cutting wiring, tokens, translations, logging | Business logic |

## Naming conventions

- **One directory per screen.** Every screen gets its own folder under
  `screens/<feature>/`. That folder holds only the screen’s view, BLoC,
  Freezed event/state, and generated parts — no separate widget *files*.
  Example:

  ```
  screens/inventory/inventory/
  ├── inventory_view.dart
  ├── inventory_bloc.dart
  ├── inventory_event.dart
  ├── inventory_state.dart
  ├── inventory_event.freezed.dart   # generated — do not edit
  ├── inventory_state.freezed.dart   # generated — do not edit
  ```

- **Widget classes:** Prefer small `Widget` subclasses over methods returning
  `Widget`. Screen-only pieces: private classes in `*_view.*`. Shared:
  `screens/components/` only — do not add separate widget files inside a
  screen directory. Subdirectories under `components/` are allowed for
  grouping.

- **Feature folders**: one folder per feature under `screens/`, then one
  subfolder per screen (as above).
- **Presentation files** use consistent suffixes so the enforcement test can key
  rules off them:
  - `*_view.*` — the UI view (render + dispatch only; **no navigation**)
  - `*_bloc.*` (or `*_controller.*`) — logic + **all navigation** (calls router)
  - `*_event.*` / `*_state.*` — Freezed inputs/outputs (codegen-friendly)
  - `*.freezed.dart` — generated Freezed parts (never hand-edit)
- **Navigation & routes:** register every screen and its route in `router/`
  when adding a screen. Only BLoCs navigate — a view that needs to leave
  dispatches an event; the BLoC calls `appRouter` helpers for that registered
  route (`goToShellTab`, `pushArchive`, `pushPresetDetail`,
  `pushProductDetail`, `replaceWithProductDetail`, `popRoute`). Never navigate
  from `*_view.*` or `screens/components/`, and never use paths that are not
  registered in the router.

  Registered routes (`lib/router/app_router.dart`):

  | Path | Screen |
  |------|--------|
  | `/` | Home (shell tab) |
  | `/inventory` | Inventory (shell tab) |
  | `/products` | Products (shell tab) |
  | `/workshop` | Workshop (shell tab) |
  | `/settings` | Settings (shell tab) |
  | `/archive` | Archive (full screen) |
  | `/products/:id` | Preset detail (full screen) |
  | `/workshop/:id` | Product / build detail (full screen) |
- **Use cases**: one class per write/delete operation, named
  `<Verb><Noun>UseCase` (e.g. `CreateOrUpdateMaterialUseCase`,
  `AddProductToWorkbenchUseCase`). Sort them into subdirectories under
  `domain/use_cases/` by the entity they serve, or by function when the
  operation is not tied to a single entity — never a flat dump of all use
  cases in `use_cases/`.

  ```
  domain/use_cases/
  ├── material/
  │   ├── add_material_stock_use_case.dart
  │   ├── create_or_update_material_use_case.dart
  │   ├── delete_material_use_case.dart
  │   └── update_material_image_use_case.dart
  ├── product/
  │   ├── add_product_to_workbench_use_case.dart
  │   ├── delete_product_use_case.dart
  │   ├── delete_used_material_use_case.dart
  │   ├── finish_product_use_case.dart
  │   ├── save_used_material_use_case.dart
  │   └── update_product_use_case.dart
  ├── preset/
  │   ├── create_or_update_preset_use_case.dart
  │   ├── delete_preset_material_use_case.dart
  │   ├── delete_preset_use_case.dart
  │   ├── save_preset_material_use_case.dart
  │   └── update_preset_image_use_case.dart
  ├── quote/
  │   └── pick_daily_quote_use_case.dart
  └── seed/
      └── seed_database_use_case.dart
  ```
- **Repository interfaces** live in `domain/repositories/`; their `...Impl` live
  in `repo/`.
- **Service ports** (interfaces to infra) live in `domain/services/`; their
  adapters live in `platform/`.
- **DAOs**: one class per table/aggregate in `db/daos/`, named
  `<Entity>Dao` in `<entity>_dao.dart`. DAOs own SQL CRUD and return domain
  entities.
- **`AppDatabase`**: connection handle, version, `onCreate`/`onUpgrade`, and
  `transaction()` for cross-DAO writes. No per-table queries — those belong in DAOs.

## Wiring (DI)

`di/` constructs concrete implementations and provides them to the presentation
layer. Controllers receive use cases and repositories via DI — they never
construct DB or platform objects directly.

**Split registration into private helpers**, then call them from one public
startup method (e.g. `configureDependencies()` / `setupDi()`) invoked from
`main` before `runApp`. Typical helpers:

- `_registerSingletons` — `AppDatabase`, DAOs, repository impls, platform
  adapters, shared clients (order: DB → DAOs → repos/adapters)
- `_registerUseCases` — domain use cases
- `_registerScreens` — BLoC / screen factories

Inside each helper, group registrations into **comment-marked sections** when
there is more than one feature area (e.g. `// inventory use cases`,
`// workshop screens`). Do not dump every registration into one flat list.

```dart
// lib/di/di.dart (conceptual)
Future<void> configureDependencies() async {
  _registerSingletons();
  _registerUseCases();
  _registerScreens();
}

void _registerSingletons() {
  // database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<MaterialDao>(() => MaterialDao(getIt()));

  // inventory repos
  getIt.registerLazySingleton<MaterialRepository>(
    () => MaterialRepositoryImpl(getIt()),
  );
}

void _registerUseCases() {
  // inventory use cases
  getIt.registerLazySingleton(() => CreateOrUpdateMaterialUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteMaterialUseCase(getIt()));

  // workshop use cases
  getIt.registerLazySingleton(() => AddProductToWorkbenchUseCase(getIt()));
}

void _registerScreens() {
  // inventory screens
  getIt.registerFactory(() => InventoryBloc(getIt(), getIt()));

  // workshop screens
  getIt.registerFactory(() => WorkshopBloc(getIt()));
}
```

## Logger setup

Centralize the `logger` package in `lib/logger/logger.dart`. Import it everywhere —
do not create ad-hoc `Logger` instances. See
[architecture.md — Logger setup](architecture.md#logger-setup)
for `PrettyPrinter` configuration (`methodCount: 1`, `errorMethodCount: 1`).
Use `logger.i` / `logger.w` / `logger.d` per AGENTS.md.
