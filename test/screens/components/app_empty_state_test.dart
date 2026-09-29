import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instock/screens/components/app_empty_state.dart';
import 'package:instock/theme/app_theme_presets.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      theme: themeDataForPreset(defaultThemePreset),
      home: Scaffold(body: child),
    );
  }

  testWidgets('renders title, subtitle, and optional action', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      wrap(
        AppEmptyState(
          icon: Icons.inventory_2_outlined,
          title: 'No materials',
          subtitle: 'Add your first stock item',
          actionLabel: 'Add material',
          onAction: () => tapped = true,
        ),
      ),
    );

    expect(find.text('No materials'), findsOneWidget);
    expect(find.text('Add your first stock item'), findsOneWidget);
    expect(find.text('Add material'), findsOneWidget);

    await tester.tap(find.text('Add material'));
    expect(tapped, isTrue);
  });

  testWidgets('hides action when label or callback is missing', (tester) async {
    await tester.pumpWidget(
      wrap(
        const AppEmptyState(
          icon: Icons.inventory_2_outlined,
          title: 'Empty',
          subtitle: 'Nothing here',
          actionLabel: 'Hidden',
        ),
      ),
    );

    expect(find.text('Empty'), findsOneWidget);
    expect(find.text('Hidden'), findsNothing);
  });
}
