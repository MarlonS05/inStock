# Inventory (materials) — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: inventory
  product_name: inStock
  source: N/A (docs catch-up from lib/)
  target_platform: Flutter (iOS / Android)
  status: shipped
-->

> **Purpose:** Machine-readable design spec for the materials inventory feature
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
| BLoC + Freezed codegen | `InventoryBloc` — Freezed event/state; run `dart run build_runner build --delete-conflicting-outputs` |
| All screens registered in `lib/router/` / `appRouter` | Shell tab `/inventory` |
| All navigation in BLoCs | No leave-screen navigation; stays on shell tab |
| Widget classes | Private widgets in `inventory_view.dart` (e.g. form popup helpers); shared under `screens/components/` |
| Infra I/O | `MaterialImageService` (platform) for gallery pick |
| Persistence | `MaterialRepository` + DAOs; reserved qty via `used_materials` |
| Writes | `CreateOrUpdateMaterialUseCase`, `DeleteMaterialUseCase`, `UpdateMaterialImageUseCase` under `domain/use_cases/material/` |
| Errors | `errorMessage` = `UiErrorCodes.*`; `BlocListener` maps to l10n |
| Theme | `AppSpacing`, `AppRadius`, `Theme.of(context)`; strings via `AppLocalizations` |

**Replaces:** N/A.

**Reference implementations:** `lib/screens/inventory/inventory/`.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Inventory | `/inventory` (shell tab) | Localized inventory title |

Entry: bottom nav tab (index 1). BLoC created with `InventoryStarted`.

### 1.2 Flows

- **List / search:** Load materials → show available vs on-hand → filter by search query.
- **Create:** FAB → material form dialog → `InventoryMaterialSaved` → use case save → refresh.
- **Edit:** Tap row → form prefilled → save / pick image / delete.
- **Delete:** Confirm → `DeleteMaterialUseCase`; blocked with `MaterialInUseException` when reserved on an active build.
- **Back:** N/A (shell tab).

---

## 2. Data model

```dart
class Material {
  String id;
  String title;
  String description;
  double quantity; // on-hand
  String? image;   // local filesystem path
}

// Domain exceptions
class MaterialInUseException { String materialId; }
```

| Value | Label | Notes |
|-------|-------|-------|
| Available qty | on-hand − reserved | `getAvailableQuantity` (single) or `getReservedQuantitiesByMaterialId` + on-hand (lists) |
| Low stock | available ≤ 0 | Chip on list tile |

**Default:** New material gets a generated id; quantity from form steppers.

**Persistence:**

| Op | Layer |
|----|-------|
| Read list / by id / available / reserved / bulk reserved | `MaterialRepository` |
| Create / update | `CreateOrUpdateMaterialUseCase` |
| Delete | `DeleteMaterialUseCase` (clears `preset_materials` lines; throws if in use) |
| Image | `UpdateMaterialImageUseCase` + `MaterialImageService` |

Tables: `materials` (reads reservation from `used_materials`).

---

## 3. Component reuse

### 3.1 Reuse as-is
`AppSearchField`, `AppEmptyState`, `AppCard` (`screens/components/`).

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
Preset BOM sheets (`screens/components/preset/`) — inventory uses its own form dialog.

### 3.4 Build new
Screen-private: material form popup / list tile helpers inside `inventory_view.dart`.

---

## 4. Screens

```yaml
route: /inventory
folder: lib/screens/inventory/inventory/
bloc: InventoryBloc
view: InventoryView
```

```
AppShell (tab)
└── InventoryView
    ├── AppBar (title)
    ├── AppSearchField
    ├── RefreshIndicator
    │   └── ListView of AppCard / MaterialListTile
    │       ├── title, available vs on-hand
    │       └── low-stock chip when available ≤ 0
    ├── AppEmptyState (opens form)
    └── FAB (+) → showMaterialFormPopup
        ├── title, description, quantity ±
        ├── (edit) image tap → pick
        └── (edit) delete confirm
```

**Selection / actions:** Tap card → edit form. Save → `CreateOrUpdateMaterialUseCase`. Image → `InventoryMaterialImagePickRequested` → platform pick → `UpdateMaterialImageUseCase`. Delete → `DeleteMaterialUseCase`.

**States & styling:** Loading / ready / error via Freezed state; snackbars from `BlocListener` on `UiErrorCodes.loadFailure`, `actionFailure`, `materialInUse`.

---

## 5. Navigation & state

### Routes

```dart
// shell tab — lib/router/app_router.dart
'/inventory'
```

No `/inventory/:id` detail route.

### BLoC events

**InventoryBloc:** `InventoryStarted`, `InventoryRefreshRequested`, `InventorySearchChanged`, `InventoryMaterialSaved`, `InventoryMaterialImageSelected`, `InventoryMaterialImagePickRequested`, `InventoryPickedImagePreviewConsumed`, `InventoryImagePickFailureConsumed`, `InventoryMaterialDeleteRequested`

- No navigation events.

---

## 6. Interaction & tokens

- Spacing / radius from `AppSpacing` / `AppRadius`.
- All screens: `BlocListener` on error state.

---

## 7. Out of scope

- Material detail route / full-screen editor.
- Cancel-build / release reservation from inventory.
- Remote sync / HTTP.
- `AddMaterialStockUseCase` (owned by Home shopping list, not this screen).

---

## Appendix A. Implementation checklist

```
[x] Data model + persistence (Material, MaterialRepository, material use cases)
[x] Shared widgets (AppSearchField, AppEmptyState, AppCard)
[x] InventoryBloc + InventoryView (Freezed + BlocListener)
[x] Route + DI wiring (shell tab, _registerScreens inventory)
[x] Verify: flutter analyze + flutter test (incl. architecture import test)
```
