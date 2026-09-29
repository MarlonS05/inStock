# Presets — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: presets
  product_name: inStock
  source: N/A (docs catch-up from lib/)
  target_platform: Flutter (iOS / Android)
  status: shipped
-->

> **Purpose:** Machine-readable design spec for presets (BOM/recipes)
> as implemented.
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
| BLoC + Freezed codegen | `ProductsBloc`, `PresetDetailBloc` — Freezed event/state |
| All screens registered in `lib/router/` / `appRouter` | `/products`, `/products/:id` |
| All navigation in BLoCs | List → `pushPresetDetail`; detail back/delete → `popRoute`; create product → `replaceWithProductDetail`; list reloads after push completes |
| Widget classes | Private widgets in each `*_view.dart`; shared preset widgets under `screens/components/preset/` |
| Infra I/O | `PresetImageService` |
| Persistence | `PresetRepository` |
| Writes | Use cases under `domain/use_cases/preset/`; create-to-workbench via `AddProductToWorkbenchUseCase` (`product/`) |
| Errors | `UiErrorCodes` + `BlocListener` |
| Theme | `AppSpacing`, `AppRadius`, `Theme.of(context)`; l10n |

**Replaces:** N/A.

**Reference implementations:** `lib/screens/products/products/`, `lib/screens/products/preset_detail/`.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Products list | `/products` (shell tab) | Localized products title |
| Preset detail | `/products/:id` | Back + preset content |

Entry: shell tab (index 2). Create: FAB creates default preset then opens detail. Tap row → detail.

### 1.2 Flows

- **List / search:** Load presets with material counts → filter → open detail.
- **Create:** FAB → `CreateOrUpdatePresetUseCase` (default name) → `pushPresetDetail`.
- **Edit metadata:** Inline name/description on detail → `CreateOrUpdatePresetUseCase`.
- **Edit BOM:** Add material sheet / quantity popover; qty ≤ 0 removes line.
- **Image:** Hero tap → pick → `UpdatePresetImageUseCase`.
- **Create product:** `AddProductToWorkbenchUseCase` (over-reservation allowed; shortages appear on home shopping list) → `replaceWithProductDetail`.
- **Delete preset:** Confirm → cascades BOM lines; products keep snapshotted fields → `popRoute`.
- **Back:** `PresetDetailBackTapped` → if opened from Create and still defaults → `DeletePresetUseCase` then `popRoute`; else `popRoute`.
- **Return to list:** Detail is nested under `/products` (`parentNavigatorKey` root) so `ProductsBloc` stays mounted; after `pushPresetDetail` completes, the list reloads.

---

## 2. Data model

```dart
class Preset {
  String id;
  String name;
  String description;
  String? image;
}

class PresetMaterial {
  String id;
  String materialId;
  String presetId;
  double quantity;
}
```

| Value | Label | Notes |
|-------|-------|-------|
| BOM line | PresetMaterial | Belongs to one preset |
| Available stock | on-hand − reserved | Shown on lists; create-to-workbench may over-reserve |

**Default:** New preset gets generated id and default localized name.

**Persistence:**

| Op | Layer |
|----|-------|
| List / get / getMaterials / getMaterialCountsByPresetId | `PresetRepository` |
| Save / delete preset | `CreateOrUpdatePresetUseCase`, `DeletePresetUseCase` |
| Save / delete BOM line | `SavePresetMaterialUseCase`, `DeletePresetMaterialUseCase` |
| Image | `UpdatePresetImageUseCase` |
| Create workbench build | `AddProductToWorkbenchUseCase` |

Tables: `presets`, `preset_materials`.

---

## 3. Component reuse

### 3.1 Reuse as-is
`AppSearchField`, `AppEmptyState`, `AppCard`, `PresetInlineEditableText`, `PresetMaterialTag`, `showPresetMaterialQuantityPopover`, `showPresetAddMaterialSheet`.

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
Inventory material form popup — presets use inline edit + BOM sheets.

### 3.4 Build new
List/detail private widgets only inside the respective `*_view.dart` files.

---

## 4. Screens

### 4.1 Products list

```yaml
route: /products
folder: lib/screens/products/products/
bloc: ProductsBloc
view: ProductsView
```

```
AppShell (tab)
└── ProductsView
    ├── AppBar
    ├── AppSearchField
    ├── RefreshIndicator → ListView of AppCard (name, description, material count)
    ├── AppEmptyState
    └── FAB (+) → create + push detail
```

**Selection / actions:** Tap card → `ProductsOpenPresetDetailTapped`. FAB → `ProductsCreateAndOpenPresetTapped`.

Note: `ProductsPresetSaved` / `ProductsPresetDeleteRequested` exist on the BLoC but are not dispatched from the list view (edit/delete live on detail).

### 4.2 Preset detail

```yaml
route: /products/:id
folder: lib/screens/products/preset_detail/
bloc: PresetDetailBloc
view: PresetDetailView
```

```
Navigator (full screen)
└── PresetDetailView
    ├── Back
    ├── Hero image (tap → pick)
    ├── PresetInlineEditableText (name, description)
    ├── BOM: PresetMaterialTag + quantity popover; add sheet
    └── Bottom bar: Create Product | Delete (confirm)
```

**Selection / actions:** Inline saves → preset use cases. Create Product → workbench use case + `replaceWithProductDetail`. Delete → pop.

**States & styling:** `UiErrorCodes.loadFailure`, `actionFailure`, `createFailure`, `notFound`.

---

## 5. Navigation & state

### Routes

```dart
'/products'
String presetDetailPath(String presetId) => '/products/$presetId';
// helpers: pushPresetDetail, replaceWithProductDetail, popRoute
// Detail is a child of `/products` with parentNavigatorKey: rootNavigatorKey
```

### BLoC events

**ProductsBloc:** `ProductsStarted`, `ProductsRefreshRequested`, `ProductsSearchChanged`, `ProductsPresetSaved`, `ProductsPresetDeleteRequested`, `ProductsOpenPresetDetailTapped`, `ProductsCreateAndOpenPresetTapped`

List open/create handlers `await pushPresetDetail` then reload presets when the future completes (return from detail).

**PresetDetailBloc:** `PresetDetailStarted`, `PresetDetailQuantityChanged`, `PresetDetailPresetUpdated`, `PresetDetailDeleteRequested`, `PresetDetailImageSelected`, `PresetDetailImagePickRequested`, `PresetDetailImagePickFailureConsumed`, `PresetDetailMaterialAdded`, `PresetDetailCreateProductRequested`, `PresetDetailBackTapped`

---

## 6. Interaction & tokens

- Spacing / radius from theme tokens.
- `BlocListener` on error state for both screens.

---

## 7. Out of scope

- Duplicate preset.
- Remote catalog / HTTP.
- Opening finished-product archive from here.

---

## Appendix A. Implementation checklist

```
[x] Data model + persistence (Preset, PresetMaterial, repos, use cases)
[x] Shared preset widgets under screens/components/preset/
[x] ProductsBloc + PresetDetailBloc + views
[x] Routes + DI wiring
[x] Verify: flutter analyze + flutter test
```
