import 'package:flutter/material.dart';
import 'package:instock/theme/app_theme.dart';

/// Rounded surface with optional padding and elevation shadow.
class AppSurface extends StatelessWidget {
  const AppSurface({
    super.key,
    required this.child,
    this.radius = AppRadius.lg,
    this.elevation = AppElevationLevel.low,
    this.padding,
    this.color,
    this.border,
  });

  final Widget child;
  final double radius;
  final AppElevationLevel elevation;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? scheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(radius),
        border: border,
        boxShadow: AppElevation.of(context, level: elevation),
      ),
      child: padding != null ? Padding(padding: padding!, child: child) : child,
    );
  }
}
