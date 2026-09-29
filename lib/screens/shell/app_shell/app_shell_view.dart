import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/screens/components/floating_bottom_nav_bar.dart';
import 'package:instock/screens/home/home/home_bloc.dart';
import 'package:instock/screens/home/home/home_view.dart';
import 'package:instock/screens/inventory/inventory/inventory_bloc.dart';
import 'package:instock/screens/inventory/inventory/inventory_view.dart';
import 'package:instock/screens/products/products/products_bloc.dart';
import 'package:instock/screens/products/products/products_view.dart';
import 'package:instock/screens/settings/settings/settings_bloc.dart';
import 'package:instock/screens/settings/settings/settings_view.dart';
import 'package:instock/screens/shell/app_shell/app_shell_bloc.dart';
import 'package:instock/screens/shell/app_shell/app_shell_event.dart';
import 'package:instock/screens/shell/app_shell/app_shell_state.dart';
import 'package:instock/screens/workshop/workshop/workshop_bloc.dart';
import 'package:instock/screens/workshop/workshop/workshop_view.dart';
import 'package:instock/theme/app_theme.dart';

/// Main app shell — PageView tabs + floating bottom nav.
///
/// Tab BLoCs are created via factories supplied by the router (no GetIt here).
class AppShellView extends StatefulWidget {
  const AppShellView({
    super.key,
    required this.initialIndex,
    required this.createHomeBloc,
    required this.createInventoryBloc,
    required this.createProductsBloc,
    required this.createWorkshopBloc,
    required this.createSettingsBloc,
  });

  final int initialIndex;
  final HomeBloc Function() createHomeBloc;
  final InventoryBloc Function() createInventoryBloc;
  final ProductsBloc Function() createProductsBloc;
  final WorkshopBloc Function() createWorkshopBloc;
  final SettingsBloc Function() createSettingsBloc;

  @override
  State<AppShellView> createState() => AppShellViewState();
}

class AppShellViewState extends State<AppShellView> {
  late final PageController _pageController;
  late int _navBarIndex;
  var _isProgrammaticPageChange = false;

  static const _navBarHeight = 56.0;
  static const _navBarVerticalPadding = AppSpacing.sm * 2;
  static const _navBarBottomMargin = AppSpacing.md;
  static const _bodyBottomPadding =
      _navBarHeight + _navBarVerticalPadding + _navBarBottomMargin + AppSpacing.lg;

  @override
  void initState() {
    super.initState();
    _navBarIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void didUpdateWidget(covariant AppShellView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex) {
      _navBarIndex = widget.initialIndex;
      _animateToPage(widget.initialIndex);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) {
    if (!_pageController.hasClients) {
      return;
    }
    if (_pageController.page?.round() == index) {
      return;
    }
    _isProgrammaticPageChange = true;
    _pageController
        .animateToPage(
          index,
          duration: AppDuration.normal,
          curve: Curves.easeInOut,
        )
        .whenComplete(() {
          if (mounted) {
            setState(() => _isProgrammaticPageChange = false);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppShellBloc, AppShellState>(
      listenWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      listener: (context, state) {
        _animateToPage(state.currentIndex);
      },
      child: Scaffold(
        extendBody: true,
        body: BlocBuilder<AppShellBloc, AppShellState>(
          builder: (context, state) {
            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                if (!_isProgrammaticPageChange) {
                  context.read<AppShellBloc>().add(AppShellPageChanged(index));
                  setState(() => _navBarIndex = index);
                }
              },
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: _bodyBottomPadding),
                  child: BlocProvider(
                    create: (_) => widget.createHomeBloc(),
                    child: const HomeView(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: _bodyBottomPadding),
                  child: BlocProvider(
                    create: (_) => widget.createInventoryBloc(),
                    child: const InventoryView(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: _bodyBottomPadding),
                  child: BlocProvider(
                    create: (_) => widget.createProductsBloc(),
                    child: const ProductsView(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: _bodyBottomPadding),
                  child: BlocProvider(
                    create: (_) => widget.createWorkshopBloc(),
                    child: const WorkshopView(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: _bodyBottomPadding),
                  child: BlocProvider(
                    create: (_) => widget.createSettingsBloc(),
                    child: const SettingsView(),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: FloatingBottomNavBar(
          currentIndex: _navBarIndex,
          onDestinationSelected: (index) {
            setState(() => _navBarIndex = index);
            context.read<AppShellBloc>().add(AppShellTabSelected(index));
          },
        ),
      ),
    );
  }
}
