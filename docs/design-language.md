# Design language — inStock

Canonical visual and layout specification for inStock. Feature design specs
(`docs/*-design-spec.md`) must follow this document. Implementation uses shared
tokens in `lib/theme/` and shared widgets in `lib/screens/components/`.

**Related:** [architecture.md](architecture.md) (theming), [product-overview.md](product-overview.md) (features).

---

## Principles

| Principle | Meaning |
|-----------|---------|
| **Soft geometry** | Generous corner radii; pills for nav and chips; no sharp rectangles. |
| **Layered depth** | Background → surface cards → floating chrome; elevation via shadow + tonal surface, not flat borders. |
| **Content-first** | Scannable lists, clear hierarchy (title → metadata → action), FAB for primary create actions. |
| **Consistent rhythm** | 4 / 8 / 16 / 24 / 32 spacing scale; 16 px screen gutters; 12–16 px gaps inside cards. |
| **Theme-aware** | All colors from `ColorScheme` / cocktail presets; no hardcoded hex in views. |

---

## Main navigation

Five tabs share a **floating bottom navigation bar**. Detail screens and
sub-flows are full-screen with back navigation and **no** floating nav.

| Tab | Route | Purpose |
|-----|-------|---------|
| Home | `/` | Inspirational quote; shopping list of missing materials |
| Inventory | `/inventory` | Materials CRUD, quantities |
| Products | `/products` | Presets (BOM / recipes) |
| Workshop | `/workshop` | Active builds / workbench reservations |
| Settings | `/settings` | Theme picker, locale, app preferences |

### Wireframe (Home)

```
┌─────────────────────────────┐
│                             │  ← no screen title on Home
│  Quote text (rainbow)       │  ← no card; gradient cut-out letters
│                             │
│  ┌─────────────────────┐    │
│  │  Shopping list      │    │  ← missing materials + buy action
│  └─────────────────────┘    │
│                             │
│   ╭─────────────────────╮   │
│   │ 🏠 📦 🧩 🔧 ⚙      │   │  ← floating pill nav, 5 destinations
│   ╰─────────────────────╯   │
└─────────────────────────────┘
```

---

## Foundations

### Spacing (`AppSpacing`)

Extend the existing tokens in `lib/theme/app_theme.dart`:

| Token | Value | Use |
|-------|-------|-----|
| `xs` | 4 | Icon–label gaps, dense inline |
| `sm` | 8 | Chip padding, list item internal |
| `md` | 16 | Screen gutter, card padding, section gaps |
| `lg` | 24 | Between major sections |
| `xl` | 32 | Hero / quote block breathing room |
| `xxl` | 48 | Top-of-screen inset below status bar (when no AppBar) |

### Radius (`AppRadius`)

| Token | Value | Use |
|-------|-------|-----|
| `sm` | 8 | Inputs, small chips |
| `md` | 12 | Buttons, compact cards |
| `lg` | 16 | Standard cards, list tiles |
| `xl` | 24 | Hero cards, quote block, modals |
| `full` | 999 | Floating nav pill, FAB, search bar |

### Elevation (`AppElevation`)

New token class — document for future implementation in `lib/theme/app_theme.dart`:

| Token | Shadow (approx) | Use |
|-------|-----------------|-----|
| `none` | — | Flush list rows on background |
| `low` | blur 8, y 2, α 0.08 | Standard cards |
| `medium` | blur 16, y 4, α 0.12 | Selected card, dropdown |
| `high` | blur 24, y 8, α 0.16 | Floating bottom nav, FAB |
| `overlay` | blur 32, y 12, α 0.20 | Dialogs, bottom sheets |

Shadow color: `ColorScheme.shadow` at listed opacity. Dark-category presets:
reduce opacity ~30 %.

### Motion (`AppDuration`)

| Token | Duration | Curve | Use |
|-------|----------|-------|-----|
| `fast` | 150 ms | `Curves.easeOut` | Nav indicator, chip toggle |
| `normal` | 250 ms | `Curves.easeInOut` | Card expand, page transitions |
| `slow` | 350 ms | `Curves.easeOutCubic` | Sheet open |

### Typography

Map to Material 3 `TextTheme`. Views use `Theme.of(context).textTheme` — never
hardcode font sizes.

| Role | Style | Use |
|------|-------|-----|
| Display | `headlineMedium`, weight 600 | Screen titles (in-body, not AppBar) |
| Title | `titleLarge`, weight 600 | Card titles, product names |
| Body | `bodyLarge` | Primary content, quantities |
| Label | `labelLarge`, weight 500 | Section headers, nav labels |
| Caption | `bodySmall` | Metadata, units, timestamps |

### Color roles

Derived from cocktail theme presets (hand-authored `ColorScheme` roles) — see
[architecture.md § Theming](architecture.md#theming).

| Role | Source | Use |
|------|--------|-----|
| Canvas | `colorScheme.surface` | Screen background |
| Card | `colorScheme.surfaceContainerLow` | List cards |
| Elevated card | `colorScheme.surfaceContainerHigh` | Selected items, elevated panels |
| Primary action | `colorScheme.primary` | FAB, active nav icon |
| On-primary | `colorScheme.onPrimary` | FAB icon |
| Muted text | `colorScheme.onSurfaceVariant` | Secondary labels |
| Divider | `colorScheme.outlineVariant` at 40 % | Rare; prefer whitespace over lines |

---

## Core components

Future location: `lib/screens/components/`. Shared components must not import
BLoC, `go_router`, repo, db, or di — see [architecture.md](architecture.md).

### FloatingBottomNavBar

- Pill container: `AppRadius.full`, height 64, horizontal margin `AppSpacing.md`,
  bottom margin `AppSpacing.md` + `SafeArea`.
- Background: `surfaceContainerHigh`; elevation `AppElevation.high`.
- **5 destinations:** Home, Inventory, Products, Workshop, Settings.
- Icons: outlined for all states; labels use `labelLarge`.
- With 5 items, use compact label text or icon-only on narrow widths (breakpoint
  TBD in implementation); default shows icon + short label.
- Active indicator: soft pill behind icon and label (`primary` at 12 % opacity),
  not underline.
- Tap target: minimum 48 × 48 per destination.
- Receives `currentIndex` + `onDestinationSelected` — no BLoC or router imports.

Suggested icons (Material, outlined):

| Tab | Icon |
|-----|------|
| Home | `Icons.home_outlined` |
| Inventory | `Icons.inventory_2_outlined` |
| Products | `Icons.category_outlined` |
| Workshop | `Icons.handyman_outlined` |
| Settings | `Icons.settings_outlined` |

### AppShell layout

Future location: `lib/screens/shell/`.

- `Scaffold` with `extendBody: true` so content scrolls under the floating nav.
- Body bottom padding: nav height + margins + `AppSpacing.lg` so the last list
  item is not obscured.
- No persistent top `AppBar` on main tabs; screen title as first sliver or
  padded text block (except Home — see below).
- Tab switching via shell BLoC + `go_router` `StatefulShellRoute`; views dispatch
  tab events, never call router directly.

### AppSurface / AppCard

- **AppSurface:** rounded rect + shadow from `AppElevation` + optional padding.
- **AppCard:** `AppSurface` preset (`radius: lg`, `elevation: low`,
  `padding: md`) for list rows.
- Pressed state (optional): scale 0.98 + elevation `none` for `AppDuration.fast`.

### AppSectionHeader

- `labelLarge`, `onSurfaceVariant`, top `lg` / bottom `sm` padding.
- No divider line.

### AppEmptyState

- Centered column: 48 px muted icon, `titleMedium` title, `bodyMedium`
  subtitle, optional `FilledButton.tonal`.
- Used when Inventory / Products / Workshop lists are empty.

### Primary FAB

- Per-tab create action: add material, add product, add to workshop.
- `FloatingActionButton` / extended FAB, `AppRadius.full`, `AppElevation.high`.
- Position: bottom-right, above floating nav (offset ~88 px from bottom).
- **Not shown on Home or Settings.**

---

## Screen layouts

### Home

- **No screen title** — content starts below status bar / safe-area inset
  (`AppSpacing.xxl` top padding).
- Hero: inspirational quote as rainbow cut-out text (no card, no attribution).
- Below quote: **shopping list** — materials with available stock ≤ 0; each row
  shows title, “X in Stock with X more needed” (on-hand vs shortage to cover
  reservations), and a shopping-bag action that prompts for quantity bought, then
  adds that amount to on-hand stock via `AddMaterialStockUseCase`.
- No FAB.
- Bottom: floating nav.

### Inventory

- Title “Inventory” as in-body Display text.
- Search / filter row (rounded search field, `AppRadius.full`).
- Scrollable list of `AppCard` rows: material name (title), right-side
  stock label (“x available / x in Stock”), “Low stock” chip when available
  ≤ 0, low-stock tint (`errorContainer` subtle) when available stock ≤ 0.
- FAB: add material.
- Create / edit: centered **popup** (`showMaterialFormPopup`) — slim stacked
  section tiles with `AppSpacing.xs` gaps so the barrier shows through
  (name → description → image when editing → tappable quantity → − | + →
  delete when editing → save). Image is tappable and persists immediately via
  gallery pick (same pattern as preset images). Top section rounds
  only its top corners; save rounds only its bottom corners; middle sections
  are square. Delete is an `error`-colored section above save when editing.
- Empty: `AppEmptyState`.
- Pull-to-refresh.

### Products

- Title “Products” as in-body Display text.
- Same list pattern as Inventory; card shows product name + material count
  summary.
- FAB: create preset.
- Tap row → detail (no bottom nav on detail).
- Pull-to-refresh.

### Workshop

- Title “Workshop” as in-body Display text.
- List of active builds; card shows product name, reserved materials summary,
  progress / status chip.
- Primary row action: “Finish” as tonal button inside card or swipe action
  (specify swipe in feature spec).
- FAB: add product to workshop.
- Header action: archive icon opens finished-products list (date-filtered).
- Empty: `AppEmptyState` explaining reservation flow.
- Pull-to-refresh.
- Workshop list shows only active (`workbench`) builds; finished products live
  in Archive.

### Settings

- Title “Settings” as in-body Display text.
- **Language:** `AppSurface` row — section title on the left, tonal button on
  the right showing the active locale (English / Deutsch). Tap cycles to the
  next language via `AppLocaleCubit.cycleLocale`.
- **Theme:** single `AppSurface` panel — “Theme” title row, horizontal divider,
  then two columns separated by a vertical divider (Light | Dark). Each column
  lists its cocktail presets vertically; tap a row to select via
  `AppThemeCubit.selectPreset`.
- **Developer:** muted card with outline; seed- and wipe-database actions via `SettingsBloc`.
- No FAB.
- Bottom: floating nav.

### Shared list rules

- One primary action per row; destructive actions in overflow menu or detail
  screen.
- Swipe-to-delete only where feature spec allows; otherwise long-press menu.
- Pull-to-refresh on Inventory, Products, and Workshop.

---

## Navigation & routes

```
/                 → Home (shell branch 0)
/inventory        → Inventory (branch 1)
/products         → Products (branch 2)
/workshop         → Workshop (branch 3)
/settings         → Settings (branch 4)
/archive          → Finished products archive (full screen, no nav)
/products/:id     → Preset detail (full screen, no nav)
/workshop/:id     → Workbench / finished product detail (full screen, no nav)
/inventory/:id    → Material detail (planned; not registered yet)
```

**l10n keys** (add to `lib/l10n/app_en.arb` and mirror in `app_de.arb`):

| Key | English (template) |
|-----|-------------------|
| `navHome` | Home |
| `navInventory` | Inventory |
| `navProducts` | Products |
| `navWorkshop` | Workshop |
| `navSettings` | Settings |

---

## Accessibility & platform

- Minimum touch target 48 dp; nav and FAB comply.
- Respect `MediaQuery.textScaler` — no fixed text heights that clip.
- `SafeArea` on all main screens; floating nav respects home indicator.
- Haptic: light impact on tab change (optional, platform adapter later).

---

## Do / Don't

**Do**

- Use `AppSpacing`, `AppRadius`, and documented elevation / motion tokens.
- Group related items in cards.
- Keep nav floating and inset from screen edges.
- Use cocktail theme `ColorScheme` roles.
- Resolve user-facing strings via `AppLocalizations`.

**Don't**

- Edge-to-edge flat lists with hairline dividers.
- Docked flush bottom nav bar.
- Hardcoded colors or font sizes in views.
- `AppBar` + floating nav double chrome on main tabs.
- Import `go_router` or `flutter_bloc` from shared components.
- Put a screen title on Home.

---

## Implementation checklist

For a follow-up implementation pass (not part of the initial doc deliverable):

```
[x] docs/design-language.md published
[x] Extend lib/theme/app_theme.dart (AppElevation, AppDuration, radius xl/full)
[ ] Extend app_theme_presets.dart (CardTheme, FABTheme, InputDecorationTheme)
[x] FloatingBottomNavBar + AppSurface + AppSectionHeader + AppEmptyState
[x] lib/screens/shell/ + StatefulShellRoute + placeholder tab views
[x] l10n nav labels (en + de)
[ ] Link from docs/architecture.md and AGENTS.md
```
