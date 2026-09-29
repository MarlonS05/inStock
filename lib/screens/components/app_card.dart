import 'package:flutter/material.dart';
import 'package:instock/screens/components/app_surface.dart';
import 'package:instock/theme/app_theme.dart';

/// Standard list card — rounded surface with low elevation and padding.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  });

  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final card = AppSurface(
      radius: AppRadius.lg,
      elevation: AppElevationLevel.low,
      color: color ?? scheme.surfaceContainerLow,
      padding: padding,
      child: child,
    );

    if (onTap == null) {
      return card;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: card,
      ),
    );
  }
}
