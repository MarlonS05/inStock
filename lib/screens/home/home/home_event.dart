import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = HomeStarted;

  const factory HomeEvent.refreshRequested() = HomeRefreshRequested;

  const factory HomeEvent.materialPurchased({
    required String materialId,
    required double quantity,
  }) = HomeMaterialPurchased;

  const factory HomeEvent.databaseRetryRequested() = HomeDatabaseRetryRequested;

  const factory HomeEvent.databaseWipeRequested() = HomeDatabaseWipeRequested;
}
