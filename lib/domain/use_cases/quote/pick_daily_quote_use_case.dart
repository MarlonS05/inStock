import 'dart:math';

import 'package:instock/domain/constants/home_quote_count.dart';

class PickDailyQuoteUseCase {
  int call({DateTime? now}) {
    final today = _localDate(now ?? DateTime.now());
    final seed = today.year * 10000 + today.month * 100 + today.day;
    return Random(seed).nextInt(homeQuoteCount);
  }

  DateTime _localDate(DateTime value) {
    return DateTime(value.year, value.month, value.day);
  }
}
