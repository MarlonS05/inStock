# Archive — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: archive
  product_name: inStock
  source: N/A (docs catch-up from lib/)
  target_platform: Flutter (iOS / Android)
  status: shipped
-->

> **Purpose:** Machine-readable design spec for the finished-products archive
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
| BLoC + Freezed codegen | `ArchiveBloc` — Freezed event/state |
| All screens registered in `lib/router/` / `appRouter` | `/archive` via `pushArchive` / `archivePath` |
| All navigation in BLoCs | Enter from Workshop; back → `popRoute` |
| Widget classes | Private widgets in `archive_view.dart` |
| Infra I/O | None |
| Persistence | `ProductRepository.getFinishedBetween` (read-only; no use case) |
| Writes | None |
| Errors | `UiErrorCodes.loadFailure` + `BlocListener` |
| Theme | Tokens + l10n |

**Replaces:** N/A.

**Reference implementations:** `lib/screens/archive/archive/`.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Archive | `/archive` (full screen above shell) | Back + localized archive title |

Entry: Workshop app-bar archive icon → `WorkshopOpenArchiveTapped` → `pushArchive`.

### 1.2 Flows

- **Load:** Initial range end = today (local start-of-day); start = end − 30 days.
- **Filter:** Date pickers clamp so start ≤ end; query uses start-of-day → end-of-day (23:59:59.999).
- **List:** Finished products by `updated_at` in range (finish sets `updated_at`).
- **Back:** `ArchiveBackTapped` → `popRoute`.

---

## 2. Data model

```dart
// Reuses Product with ProductState.finished
class Product {
  String id;
  ProductState state; // finished
  String presetId;
  String presetName;
  String presetDescription;
  String customer;
  DateTime updatedAt; // finish timestamp for archive filter
}
```

| Value | Label | Notes |
|-------|-------|-------|
| Default range | last 30 days through today | `ArchiveState.initial` |
| Filter field | `products.updated_at` | Set to finish time by `FinishProductUseCase` |

**Persistence:** `ProductRepository.getFinishedBetween(startInclusive:, endInclusive:)` only. No write use cases.

Table: `products`.

---

## 3. Component reuse

### 3.1 Reuse as-is
`AppSurface` (date filter chrome), `AppEmptyState`, `AppCard` patterns for rows.

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
Workshop shortage pills / finish controls.

### 3.4 Build new
`ArchiveDateFilter`, `ArchiveProductCard` as private widgets in `archive_view.dart`.

---

## 4. Screens

```yaml
route: /archive
folder: lib/screens/archive/archive/
bloc: ArchiveBloc
view: ArchiveView
```

```
Navigator (full screen, no bottom nav)
└── ArchiveView
    ├── AppBar (back)
    ├── ArchiveDateFilter (AppSurface)
    │   ├── start date picker
    │   └── end date picker
    ├── RefreshIndicator
    │   └── ListView of ArchiveProductCard
    │       ├── preset name, customer
    │       └── finished date (updatedAt)
    └── AppEmptyState
```

**Selection / actions:** Cards are **not** tappable to product detail. Date changes reload list.

**States & styling:** Loading / ready / empty; error snackbar for `loadFailure`.

---

## 5. Navigation & state

### Routes

```dart
const archivePath = '/archive';
Future<T?> pushArchive<T extends Object?>() => appRouter.push<T>(archivePath);
```

### BLoC events

**ArchiveBloc:** `ArchiveStarted`, `ArchiveRefreshRequested`, `ArchiveStartDateChanged`, `ArchiveEndDateChanged`, `ArchiveBackTapped`

- `ArchiveBackTapped` → `popRoute`.

---

## 6. Interaction & tokens

- Date pickers: range year 2000 → now.
- Spacing via `AppSpacing` / surfaces via `AppSurface`.
- `BlocListener` on error state.

---

## 7. Out of scope

- Opening product detail from an archive row.
- Export / share finished builds.
- Cancelled builds (not a product state).
- Remote sync / HTTP.

---

## Appendix A. Implementation checklist

```
[x] Read path via ProductRepository.getFinishedBetween
[x] ArchiveBloc + ArchiveView (date filter + list)
[x] Route + DI wiring (archive screens section)
[x] Verify: flutter analyze + flutter test
```
