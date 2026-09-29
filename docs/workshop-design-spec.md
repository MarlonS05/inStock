# Workshop (workbench) — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: workshop
  product_name: inStock
  source: N/A (docs catch-up from lib/)
  target_platform: Flutter (iOS / Android)
  status: shipped
-->

> **Purpose:** Machine-readable design spec for the workbench / workshop
> feature as implemented.
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
| BLoC + Freezed codegen | `WorkshopBloc`, `ProductDetailBloc` — Freezed event/state |
| All screens registered in `lib/router/` / `appRouter` | `/workshop`, `/workshop/:id`; archive via `pushArchive` |
| All navigation in BLoCs | `pushProductDetail`, `pushArchive`, `popRoute` |
| Widget classes | Private widgets in each `*_view.dart`; shared preset BOM widgets reused |
| Infra I/O | None beyond repos (no image pick on builds) |
| Persistence | `ProductRepository` (+ materials for stock) |
| Writes | Use cases under `domain/use_cases/product/` |
| Errors | `UiErrorCodes` + `BlocListener` |
| Theme | Tokens + l10n |

**Replaces:** N/A.

**Reference implementations:** `lib/screens/workshop/workshop/`, `lib/screens/workshop/product_detail/`.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Workshop list | `/workshop` (shell tab) | Title + archive icon |
| Product / build detail | `/workshop/:id` | Back + build fields |

Entry: shell tab (index 3). Builds are created from preset detail (“Create Product”). Archive icon opens `/archive`.

### 1.2 Flows

- **List active builds:** `getByState(ProductState.workbench)` only.
- **Open detail:** Tap card → `pushProductDetail`.
- **Open archive:** App bar → `pushArchive`.
- **Edit build (workbench only):** Inline name / description / customer; edit/add/remove `UsedMaterial` lines (qty > 0; over-reservation allowed). An empty customer renders the localized `workshopCustomerPlaceholder` in both editable and read-only detail states.
- **Finish:** Confirm → `FinishProductUseCase` (subtract on-hand, delete used rows, `state=finished`, bump `updatedAt`) → stay on detail read-only.
- **Remove:** Confirm → `DeleteProductUseCase` (delete product; used-material rows cascade away, releasing reservations without consuming stock) → `popRoute`.
- **Back:** `popRoute`.

**Reservation model:** Add-to-workbench snapshots preset display fields + BOM into `UsedMaterial` (no on-hand change; over-reservation allowed). Available = on-hand − reserved. Materials with available ≤ 0 appear on the home shopping list. Finish consumes reserved quantities. Remove releases reservations without consuming stock.

---

## 2. Data model

```dart
enum ProductState { workbench, finished }

class Product {
  String id;
  ProductState state;
  String presetId; // historical; no FK
  String presetName;
  String presetDescription;
  String customer;
  DateTime updatedAt;
}

class UsedMaterial {
  String id;
  String productId;
  String materialId;
  double quantity;
}
```

| Value | Label | Notes |
|-------|-------|-------|
| workbench | Active | Shown on Workshop list |
| finished | Done | Shown in Archive; detail read-only |

**Default:** Customer may start empty; `updatedAt` set on create/update/finish.

**Persistence:**

| Op | Layer |
|----|-------|
| List by state / get / used materials (single + bulk by product id) | `ProductRepository` (`getUsedMaterialsByProductId` for workshop list) |
| Bulk reserved qty (list shortage) | `MaterialRepository.getReservedQuantitiesByMaterialId` |
| Add to workbench | `AddProductToWorkbenchUseCase` (also from presets) |
| Update product fields | `UpdateProductUseCase` |
| Save / delete used material | `SaveUsedMaterialUseCase`, `DeleteUsedMaterialUseCase` |
| Finish | `FinishProductUseCase` |
| Remove (release reservations) | `DeleteProductUseCase` |

Tables: `products`, `used_materials`, `materials`.

---

## 3. Component reuse

### 3.1 Reuse as-is
`AppCard`, `AppEmptyState`, `PresetInlineEditableText`, `PresetMaterialTag`, quantity popover, add-material sheet.

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
Archive date filter — workshop list has no date filter.

### 3.4 Build new
`WorkshopProjectCard`, finish button, shortage/status pills as private widgets in the view files.

---

## 4. Screens

### 4.1 Workshop list

```yaml
route: /workshop
folder: lib/screens/workshop/workshop/
bloc: WorkshopBloc
view: WorkshopView
```

```
AppShell (tab)
└── WorkshopView
    ├── AppBar + archive IconButton
    ├── RefreshIndicator
    │   └── ListView of WorkshopProjectCard (AppCard)
    │       ├── preset name, customer, status pill
    │       └── shortage when reserved > on-hand
    └── AppEmptyState
```

No search / FAB on this screen.

### 4.2 Product detail

```yaml
route: /workshop/:id
folder: lib/screens/workshop/product_detail/
bloc: ProductDetailBloc
view: ProductDetailView
```

```
Navigator (full screen)
└── ProductDetailView
    ├── Back
    ├── PresetInlineEditableText (name, description, customer) — if workbench
    ├── Used materials: tags + popover + add sheet — if workbench
    ├── Finish button + confirm — if workbench
    ├── Remove button + confirm — if workbench
    └── After finish: read-only + success snackbar
```

**States & styling:** `loadFailure`, `actionFailure`, `notFound`, `finishFailure`.

---

## 5. Navigation & state

### Routes

```dart
'/workshop'
String productDetailPath(String productId) => '/workshop/$productId';
// helpers: pushProductDetail, pushArchive, popRoute
```

### BLoC events

**WorkshopBloc:** `WorkshopStarted`, `WorkshopRefreshRequested`, `WorkshopOpenArchiveTapped`, `WorkshopOpenProductDetailTapped`

**ProductDetailBloc:** `ProductDetailStarted`, `ProductDetailProductUpdated`, `ProductDetailQuantityChanged`, `ProductDetailMaterialAdded`, `ProductDetailFinishRequested`, `ProductDetailRemoveRequested`, `ProductDetailBackTapped`

---

## 6. Interaction & tokens

- Theme tokens for spacing/radius.
- `BlocListener` on both screens.

---

## 7. Out of scope

- Creating builds from the workshop list FAB (create is from presets).
- Opening archive items into detail.
- Remote sync / HTTP.

---

## Appendix A. Implementation checklist

```
[x] Data model + persistence (Product, UsedMaterial, product use cases)
[x] Shared BOM editing widgets reused from components/preset/
[x] WorkshopBloc + ProductDetailBloc + views
[x] Routes + DI wiring
[x] Verify: flutter analyze + flutter test
```
