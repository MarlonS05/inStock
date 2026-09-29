import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instock/screens/components/search/app_search_field.dart';
import 'package:instock/theme/app_theme_presets.dart';

void main() {
  testWidgets('reports text changes', (tester) async {
    final values = <String>[];

    await tester.pumpWidget(
      MaterialApp(
        theme: themeDataForPreset(defaultThemePreset),
        home: Scaffold(
          body: AppSearchField(
            hintText: 'Search materials',
            onChanged: values.add,
          ),
        ),
      ),
    );

    expect(find.text('Search materials'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'oak');
    expect(values, ['oak']);
  });
}
