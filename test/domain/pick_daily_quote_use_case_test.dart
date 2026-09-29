import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/use_cases/quote/pick_daily_quote_use_case.dart';

void main() {
  final useCase = PickDailyQuoteUseCase();

  test('returns stable index for the same calendar day', () {
    final morning = DateTime(2026, 7, 15, 8, 30);
    final evening = DateTime(2026, 7, 15, 22, 45);

    expect(useCase(now: morning), useCase(now: evening));
  });

  test('wraps within quote count', () {
    expect(useCase(now: DateTime(2026, 7, 15)), inInclusiveRange(0, 106));
  });

  test('can return different indices across distant days', () {
    final indices = {
      for (var day = 1; day <= 30; day++)
        useCase(now: DateTime(2026, 7, day)),
    };
    expect(indices.length, greaterThan(1));
  });
}
