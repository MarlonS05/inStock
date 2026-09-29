import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_event.freezed.dart';

@freezed
sealed class ArchiveEvent with _$ArchiveEvent {
  const factory ArchiveEvent.started() = ArchiveStarted;

  const factory ArchiveEvent.refreshRequested() = ArchiveRefreshRequested;

  const factory ArchiveEvent.startDateChanged(DateTime date) =
      ArchiveStartDateChanged;

  const factory ArchiveEvent.endDateChanged(DateTime date) =
      ArchiveEndDateChanged;

  const factory ArchiveEvent.backTapped() = ArchiveBackTapped;
}
