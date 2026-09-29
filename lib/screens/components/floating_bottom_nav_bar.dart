import 'package:flutter/material.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/components/app_surface.dart';
import 'package:instock/theme/app_theme.dart';

/// Floating pill bottom navigation — no BLoC or router imports.
class FloatingBottomNavBar extends StatelessWidget {
  const FloatingBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  static const _destinations = [
    _NavDestination(icon: Icons.home_outlined, labelKey: _NavLabel.home),
    _NavDestination(
      icon: Icons.inventory_2_outlined,
      labelKey: _NavLabel.inventory,
    ),
    _NavDestination(icon: Icons.category_outlined, labelKey: _NavLabel.products),
    _NavDestination(icon: Icons.handyman_outlined, labelKey: _NavLabel.workshop),
    _NavDestination(icon: Icons.settings_outlined, labelKey: _NavLabel.settings),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return SafeArea(
      minimum: const EdgeInsets.only(
        left: AppSpacing.md,
        right: AppSpacing.md,
        bottom: AppSpacing.md,
      ),
      child: AppSurface(
        radius: AppRadius.full,
        elevation: AppElevationLevel.high,
        color: scheme.surfaceContainerHigh,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.sm,
        ),
        child: SizedBox(
          height: 56,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth / _destinations.length;

              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: AppDuration.normal,
                    curve: Curves.easeInOut,
                    left: currentIndex * itemWidth,
                    width: itemWidth,
                    top: 0,
                    bottom: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: scheme.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (var i = 0; i < _destinations.length; i++)
                        Expanded(
                          child: _NavItem(
                            destination: _destinations[i],
                            label: _labelFor(l10n, _destinations[i].labelKey),
                            isSelected: i == currentIndex,
                            onTap: () => onDestinationSelected(i),
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String _labelFor(AppLocalizations l10n, _NavLabel key) {
    return switch (key) {
      _NavLabel.home => l10n.navHome,
      _NavLabel.inventory => l10n.navInventory,
      _NavLabel.products => l10n.navProducts,
      _NavLabel.workshop => l10n.navWorkshop,
      _NavLabel.settings => l10n.navSettings,
    };
  }
}

enum _NavLabel { home, inventory, products, workshop, settings }

class _NavDestination {
  const _NavDestination({required this.icon, required this.labelKey});

  final IconData icon;
  final _NavLabel labelKey;
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final _NavDestination destination;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48, minWidth: 48),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                destination.icon,
                color: isSelected ? scheme.primary : scheme.onSurfaceVariant,
                size: 22,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.labelSmall?.copyWith(
                  color: isSelected ? scheme.primary : scheme.onSurfaceVariant,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
