import 'package:flutter/material.dart';

/// Design token spacing values.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

/// Design token radius values.
abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double full = 999;
}

/// Shadow elevation tokens — see docs/design-language.md.
abstract final class AppElevation {
  static List<BoxShadow> of(
    BuildContext context, {
    required AppElevationLevel level,
  }) {
    final shadow = Theme.of(context).colorScheme.shadow;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final opacityScale = isDark ? 0.7 : 1.0;

    final (blur, y, opacity) = switch (level) {
      AppElevationLevel.none => (0.0, 0.0, 0.0),
      AppElevationLevel.low => (8.0, 2.0, 0.08),
      AppElevationLevel.medium => (16.0, 4.0, 0.12),
      AppElevationLevel.high => (24.0, 8.0, 0.16),
      AppElevationLevel.overlay => (32.0, 12.0, 0.20),
    };

    if (level == AppElevationLevel.none) {
      return const [];
    }

    return [
      BoxShadow(
        color: shadow.withValues(alpha: opacity * opacityScale),
        blurRadius: blur,
        offset: Offset(0, y),
      ),
    ];
  }
}

enum AppElevationLevel { none, low, medium, high, overlay }

/// Motion duration tokens — see docs/design-language.md.
abstract final class AppDuration {
  static const fast = Duration(milliseconds: 150);
  static const normal = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 350);
}
