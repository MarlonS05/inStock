import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:instock/screens/archive/archive/archive_bloc.dart';
import 'package:instock/screens/archive/archive/archive_event.dart';
import 'package:instock/screens/archive/archive/archive_view.dart';
import 'package:instock/screens/home/home/home_bloc.dart';
import 'package:instock/screens/home/home/home_event.dart';
import 'package:instock/screens/inventory/inventory/inventory_bloc.dart';
import 'package:instock/screens/inventory/inventory/inventory_event.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_bloc.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_event.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_view.dart';
import 'package:instock/screens/products/products/products_bloc.dart';
import 'package:instock/screens/products/products/products_event.dart';
import 'package:instock/screens/settings/settings/settings_bloc.dart';
import 'package:instock/screens/shell/app_shell/app_shell_bloc.dart';
import 'package:instock/screens/shell/app_shell/app_shell_event.dart';
import 'package:instock/screens/shell/app_shell/app_shell_view.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_bloc.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_event.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_view.dart';
import 'package:instock/screens/workshop/workshop/workshop_bloc.dart';
import 'package:instock/screens/workshop/workshop/workshop_event.dart';

/// Tab paths for the main app shell (index matches bottom nav order).
const shellTabPaths = [
  '/',
  '/inventory',
  '/products',
  '/workshop',
  '/settings',
];

/// Full-screen archive route (above the shell; no bottom nav).
const archivePath = '/archive';

/// Preset detail path for [presetId].
String presetDetailPath(String presetId) => '/products/$presetId';

/// Workbench / finished product detail path for [productId].
String productDetailPath(String productId) => '/workshop/$productId';

/// Preserves shell state (PageView position) across tab route changes.
final GlobalKey<AppShellViewState> appShellViewKey =
    GlobalKey<AppShellViewState>();

/// Root navigator for shell + full-screen routes.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// Returns the shell tab index for [location], or `-1` when [location] is a
/// full-screen overlay (archive / detail) so the current tab is preserved.
int tabIndexFromLocation(String location) {
  final path = Uri.parse(location).path;
  return shellTabPaths.indexOf(path);
}

/// Navigates to the shell tab at [index] without transition animation.
void goToShellTab(int index) {
  if (index < 0 || index >= shellTabPaths.length) {
    return;
  }
  final path = shellTabPaths[index];
  if (appRouter.state.uri.path != path) {
    appRouter.go(path);
  }
}

/// Pushes the archive screen above the shell.
Future<T?> pushArchive<T extends Object?>() {
  return appRouter.push<T>(archivePath);
}

/// Pushes preset detail for [presetId].
///
/// When [untouchedDraftDefaultName] is set (create flow), back may discard
/// the preset if it still matches create-time defaults.
Future<T?> pushPresetDetail<T extends Object?>(
  String presetId, {
  String? untouchedDraftDefaultName,
}) {
  return appRouter.push<T>(
    presetDetailPath(presetId),
    extra: untouchedDraftDefaultName,
  );
}

/// Pushes product (build) detail for [productId].
Future<T?> pushProductDetail<T extends Object?>(String productId) {
  return appRouter.push<T>(productDetailPath(productId));
}

/// Replaces the current route with product detail (e.g. after create-from-preset).
void replaceWithProductDetail(String productId) {
  appRouter.pushReplacement(productDetailPath(productId));
}

/// Pops the current route when possible.
void popRoute<T extends Object?>([T? result]) {
  if (appRouter.canPop()) {
    appRouter.pop(result);
  }
}

NoTransitionPage<void> _shellPlaceholder(GoRouterState state) {
  return NoTransitionPage<void>(
    key: state.pageKey,
    child: const SizedBox.shrink(),
  );
}

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final index = tabIndexFromLocation(state.uri.path);
        final shellBloc = GetIt.instance<AppShellBloc>();
        if (index >= 0) {
          shellBloc.add(AppShellRouteChanged(index));
        }

        return BlocProvider.value(
          value: shellBloc,
          child: AppShellView(
            key: appShellViewKey,
            initialIndex: index >= 0 ? index : shellBloc.state.currentIndex,
            createHomeBloc: () =>
                GetIt.instance<HomeBloc>()..add(const HomeStarted()),
            createInventoryBloc: () => GetIt.instance<InventoryBloc>()
              ..add(const InventoryStarted()),
            createProductsBloc: () =>
                GetIt.instance<ProductsBloc>()..add(const ProductsStarted()),
            createWorkshopBloc: () =>
                GetIt.instance<WorkshopBloc>()..add(const WorkshopStarted()),
            createSettingsBloc: () => GetIt.instance<SettingsBloc>(),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _shellPlaceholder(state),
        ),
        GoRoute(
          path: '/inventory',
          pageBuilder: (context, state) => _shellPlaceholder(state),
        ),
        GoRoute(
          path: '/products',
          pageBuilder: (context, state) => _shellPlaceholder(state),
          routes: [
            // Full-screen above the shell; nesting keeps ProductsBloc mounted
            // so await pushPresetDetail completes and the list can reload.
            GoRoute(
              path: ':id',
              parentNavigatorKey: rootNavigatorKey,
              builder: (context, state) {
                final presetId = state.pathParameters['id']!;
                final untouchedDraftDefaultName = state.extra as String?;
                return BlocProvider(
                  create: (_) => GetIt.instance<PresetDetailBloc>()
                    ..add(
                      PresetDetailStarted(
                        presetId,
                        untouchedDraftDefaultName: untouchedDraftDefaultName,
                      ),
                    ),
                  child: const PresetDetailView(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/workshop',
          pageBuilder: (context, state) => _shellPlaceholder(state),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => _shellPlaceholder(state),
        ),
      ],
    ),
    GoRoute(
      path: archivePath,
      builder: (context, state) => BlocProvider(
        create: (_) =>
            GetIt.instance<ArchiveBloc>()..add(const ArchiveStarted()),
        child: const ArchiveView(),
      ),
    ),
    GoRoute(
      path: '/workshop/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return BlocProvider(
          create: (_) => GetIt.instance<ProductDetailBloc>()
            ..add(ProductDetailStarted(productId)),
          child: const ProductDetailView(),
        );
      },
    ),
  ],
);
