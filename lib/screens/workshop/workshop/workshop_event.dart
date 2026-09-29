import 'package:freezed_annotation/freezed_annotation.dart';

part 'workshop_event.freezed.dart';

@freezed
sealed class WorkshopEvent with _$WorkshopEvent {
  const factory WorkshopEvent.started() = WorkshopStarted;

  const factory WorkshopEvent.refreshRequested() = WorkshopRefreshRequested;

  const factory WorkshopEvent.openArchiveTapped() = WorkshopOpenArchiveTapped;

  const factory WorkshopEvent.openProductDetailTapped(String productId) =
      WorkshopOpenProductDetailTapped;
}
