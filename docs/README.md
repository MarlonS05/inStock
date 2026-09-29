# Project docs

inStock agent and architecture documentation. `AGENTS.md` at the repo root is
always loaded for coding agents; detail lives here.

## Philosophy

1. **Rules are terse and enforced.** `AGENTS.md` states the layering rules in a
   few lines. The rules are mirrored by `lint_rules` and
   `test/architecture/layer_import_test.dart`. Prose that isn't enforced rots;
   enforced prose stays true.
2. **The dependency graph points one way.** The domain layer is pure and depends
   on nothing framework-specific. Everything else depends inward. A single
   "strict import table" is the source of truth for who may import whom.
3. **Specs are machine-readable.** Each feature gets a design spec with an
   `AGENT METADATA` header, a data model, component-reuse tables, per-screen
   structure, state/events, and an implementation checklist.

## Docs map

| File | Purpose |
|------|---------|
| [../AGENTS.md](../AGENTS.md) | Terse, always-loaded rules for coding agents. |
| [architecture.md](architecture.md) | Layer responsibilities, strict import table, data-flow, theming, i18n. |
| [project-structure.md](project-structure.md) | Folder tree + naming conventions. |
| [enforcement.md](enforcement.md) | How import boundaries fail the build (`lint_rules` + architecture test). |
| [product-overview.md](product-overview.md) | Product behavior (materials, presets, workbench). |
| [design-language.md](design-language.md) | Visual / UX language notes. |
| [agent-guidelines/](agent-guidelines/) | Dart/Flutter practices (style, serialization, testing, UI, dartdoc). |
| [design-spec.template.md](design-spec.template.md) | Copy to `docs/<feature>-design-spec.md` per feature. |
| [architecture.template.md](architecture.template.md) | Stack-agnostic architecture template (filled copy is `architecture.md`). |

## How to add a feature

1. Read [product-overview.md](product-overview.md) and [architecture.md](architecture.md).
2. Copy [design-spec.template.md](design-spec.template.md) to
   `docs/<feature>-design-spec.md` and fill it in before implementing.
3. Follow [project-structure.md](project-structure.md) (one directory per screen,
   Freezed event/state, routes in `lib/router/`).
4. Keep boundaries honest — see below.

## Keeping it honest

The three enforcement artifacts must stay in sync — change one, change all three:

- The **strict import table** in `docs/architecture.md`
- The **deny-lists** in `lint_rules/lib/layer_import_rules.dart`
- The **test** in `test/architecture/layer_import_test.dart`

If a boundary changes, update all three in the same commit.
