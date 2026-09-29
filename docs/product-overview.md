# Product overview — inStock

inStock is a mobile inventory app for makers and small workshops. Track raw
materials, define reusable product recipes, start builds even when stock is
short (shortages land on the shopping list), and work through builds on a
workbench that reserves materials until the product is finished.

## Core workflow

1. **Maintain a materials inventory** — each material has a quantity on hand.
2. **Define presets** — reusable recipes: a product name plus the
   materials and quantities required to make one unit.
3. **Start a build** — add a product to the workbench from a preset even if
   stock is short; shortages surface on the home shopping list (available ≤ 0).
4. **Use the workbench** — the build snapshots the preset name and description plus `UsedMaterial` rows for the BOM, then **reserves** those quantities (reducing available stock without consuming it). When the build
   is **finished**, reserved quantities are **subtracted** from inventory.

Reserved stock is unavailable for other builds until the workbench item is
finished or removed (removal deletes the build and releases reservations
without consuming inventory).

## Features

| Feature | Description | Status |
|---------|-------------|--------|
| Materials inventory | CRUD for materials and on-hand quantities (list, search, form dialog, image, delete) | Shipped — see [inventory-design-spec.md](inventory-design-spec.md) |
| Presets | Custom BOM/recipe definitions; list + detail with inline metadata/BOM editing and image | Shipped — see [presets-design-spec.md](presets-design-spec.md) |
| Availability check | Compare preset requirements against available (non-reserved) stock | Shipped — via `MaterialRepository.getAvailableQuantity`; used for display (e.g. shopping list). Create-to-workbench and reservation edits allow over-reservation |
| Workbench | Reserve materials on add; subtract on finish; edit build fields and reservations; remove to release reservations | Shipped — list + detail/finish/remove — see [workshop-design-spec.md](workshop-design-spec.md) |
| Archive | List finished products filtered by finish date range | Shipped — date filters; no open-detail from archive — see [archive-design-spec.md](archive-design-spec.md) |
| Multi-language | Localized UI via ARB files | Shipped — en/de cycle in settings — see [settings-design-spec.md](settings-design-spec.md) |
| Color themes | Cocktail-named theme presets, persisted | Shipped — settings theme panel — see [settings-design-spec.md](settings-design-spec.md) |
| Quote of the day | Inspirational quote selected deterministically for each local calendar day; consecutive days may repeat | Shipped — home screen (`PickDailyQuoteUseCase`) |
| Shopping list | Home widget listing materials with available stock ≤ 0 (including over-reserved BOM lines after create-to-workbench); mark purchases to restock | Shipped — home screen (`AddMaterialStockUseCase`) |

## Terminology

| Term | Meaning |
|------|---------|
| **Material** | A trackable stock item (e.g. wood, screws, fabric), optionally with a local image path. |
| **Preset** | A reusable recipe: product + required materials/quantities. Not a UI theme. |
| **Theme preset** | A cocktail-named color scheme (`cosmopolitan`, …). See [architecture.md](architecture.md#theming). |
| **Used material** | A snapshot of materials required for one workbench build, copied from the preset BOM at creation time. |
| **Available stock** | On-hand quantity minus quantities reserved via `UsedMaterial` rows on active workbench products. |
| **Workbench** | Active builds; each entry snapshots its preset name/description and BOM, then reserves materials via `UsedMaterial` rows. |

## Related docs

- [architecture.md](architecture.md) — layers, data flow, theming, i18n
- [project-structure.md](project-structure.md) — folder layout
- Feature design specs (`docs/*-design-spec.md`) — describe current implementation; update when changing a feature
