import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instock/domain/entities/product.dart';

part 'archive_state.freezed.dart';

enum ArchiveStatus { initial, loading, loaded, failure }

@freezed
abstract class ArchiveState with _$ArchiveState {
  const factory ArchiveState({
    @Default(ArchiveStatus.initial) ArchiveStatus status,
    @Default([]) List<Product> products,
    required DateTime startDate,
    required DateTime endDate,
    String? errorMessage,
  }) = _ArchiveState;

  factory ArchiveState.initial() {
    return ArchiveState(
      startDate: _defaultStartDate(),
      endDate: _defaultEndDate(),
    );
  }

  static DateTime _defaultEndDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime _defaultStartDate() {
    final end = _defaultEndDate();
    return end.subtract(const Duration(days: 30));
  }
}
