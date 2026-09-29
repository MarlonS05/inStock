# AGENTS.md — inStock

Mobile inventory app for makers and small workshops (materials, product
presets, workbench). Read `docs/product-overview.md` for product behavior.
Read `docs/architecture.md` and the relevant `docs/*-design-spec.md` before
making changes. For Dart/Flutter practices, see `docs/agent-guidelines/`.

## Architecture & layers

- **Layers:** domain (pure business logic), repo (repository impls), db
  (persistence), platform (OS/plugin adapters), screens (views + BLoCs),
  router/di/theme/l10n (cross-cutting).
- **BLoC** talks to a **use case** for writes/deletes and to a **repository
  interface** for simple reads.
- **All navigation happens in BLoCs** — views only dispatch events; never
  call the router or navigator from a view/widget. Views dispatch events;
  BLoC calls `appRouter` (`go_router`) — never `context.go` / `Navigator` /
  go_router imports in `*_view.*` or shared components.
- **Register every screen in `lib/router/`** — each screen has a route
  entry; BLoCs navigate only via those registered routes (never ad-hoc paths
  or view-level navigation).
- **No infrastructure in BLoC** (no sqflite, http, path_provider, or other
  data-access/OS plugins).
- **`lib/domain/` must not import** Flutter, flutter_bloc, go_router, or any
  outer layer (`screens/`, `repo/`, `db/`, `platform/`, `router/`, `di/`,
  `theme/`).
- Import boundaries are enforced by `lint_rules` and
  `test/architecture/layer_import_test.dart`. Update both (and
  `docs/architecture.md`) if boundaries change.

## Conventions

- **One directory per screen** under `screens/<feature>/<screen>/` — BLoC,
  Freezed event/state, and UI (`*_view`) live together; never share a folder
  across screens (see project-structure.md).
- **Widget classes.** Prefer `Widget` classes over helper methods that return
  a `Widget`. Screen-specific private widgets live in the same `*_view.*`
  file; shared widgets live under `screens/components/` (see
  project-structure.md). Prefer `StatelessWidget` before `StatefulWidget`.
- **Dart/Flutter practices.** Interaction, tooling, style, serialization,
  testing, layout/assets, and dartdoc — see `docs/agent-guidelines/`.
- **Use cases grouped by entity/function** under `domain/use_cases/<group>/`
  — do not dump all use cases in one flat folder (see project-structure.md).
- **DI registration split by kind** in `di/` — `_registerSingletons`,
  `_registerUseCases`, `_registerScreens` (etc.), with comment-marked
  sections inside (e.g. `// inventory use cases`); call them from one startup
  method in `main` (see project-structure.md).
- **Routes + navigation.** Register every new screen and its route in
  `router/`. Views dispatch navigation-intent events; the BLoC calls the
  router for that registered route. No `context.go` / `Navigator` / router
  imports in `*_view.*` or shared components.
- **Keep docs in sync.** When you add or change functionality, structure, or
  layer boundaries, update the relevant docs in the same change — especially
  `docs/architecture.md`, affected `docs/*-design-spec.md`, and enforcement
  artifacts (lint rules, architecture tests) when boundaries change.
- Freezed for screen event/state; after edits run
  `dart run build_runner build --delete-conflicting-outputs`. Do not
  hand-edit `*.freezed.dart`.
- UI uses `lib/theme/app_theme.dart` tokens (`AppSpacing`, `AppRadius`, theme
  presets); strings via `AppLocalizations` / `lib/l10n/*.arb`. Errors via
  BLoC error state + `BlocListener` in views; no UI copy in BLoC/domain.
- Keep `CREATE TABLE` in `lib/db/schema/tables.dart` aligned with the current
  schema (fresh installs). When an existing install must upgrade, bump
  `AppDatabase.version` and add a step in `lib/db/migrations/`. Do not leave
  CREATE TABLE and migrations out of sync.
- When a shared HTTP client exists, log API interactions at completion — see
  `docs/architecture.md` (core rules); use `Success …` / `Failed …` with
  `logger.i` / `logger.w`. (App is local SQLite only today.)
- Configure the shared logger in `lib/logger/` — see `docs/architecture.md`
  (Logger setup) for `PrettyPrinter` options.
- Temporary diagnostic logs while investigating: `logger.d` only — remove before
  considering work done.

## Inventory & workbench

Presets are BOM/recipe definitions (not theme presets). Workbench
builds reserve materials via `UsedMaterial` rows on add, then subtract from
inventory on finish. Available stock = on hand − reserved. See
`docs/product-overview.md` and the relevant `docs/*-design-spec.md`.

## Plan mode

When using Plan mode, the plan body contains only three sections —
**Description**, **Files & layers** (mermaid diagram), and **Code to add**
(exact snippets, not prose about what to write). Omit goals-as-bullets, step
narratives, checklists, assumptions, and file-touch summaries.

## Commits

Use this format for commit messages:

```
[<type>] <short description>
```

Choose `type` from:

| Type | Use for |
|------|---------|
| `feat` | Feature |
| `fix` | Bugfix |
| `style` | Styling |
| `refrac` | Verbesserung des Codes |
| `test` | Automatisierte Tests |
| `docs` | Dokumentation |
| `project` | Änderungen der Projektkonfiguration |
| `perf` | Verbesserung der Performance |
| `wip` | Work in Progress / Zwischenstände |

Example: `[feat] Add order export to CSV`

## Verify

```bash
flutter analyze
flutter test
```
