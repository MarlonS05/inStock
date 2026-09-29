import 'package:flutter_test/flutter_test.dart';
import 'package:instock/di/di.dart';
import 'package:instock/domain/use_cases/quote/pick_daily_quote_use_case.dart';
import 'package:instock/main.dart';
import 'package:instock/screens/home/home/home_view.dart';
import 'package:instock/l10n/app_localizations_en.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    await getIt.reset();
    await configureDependencies(databasePathOverride: inMemoryDatabasePath);
  });

  testWidgets('shows daily home quote on launch', (tester) async {
    await tester.pumpWidget(const InStockApp());
    await tester.pumpAndSettle();

    final quoteIndex = PickDailyQuoteUseCase()();
    final quote = AppLocalizationsEn().homeQuoteAt(quoteIndex);

    expect(find.text(quote), findsOneWidget);
  });
}
