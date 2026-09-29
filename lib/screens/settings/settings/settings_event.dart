import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.seedDatabaseRequested() =
      SettingsSeedDatabaseRequested;
  const factory SettingsEvent.wipeDatabaseRequested() =
      SettingsWipeDatabaseRequested;
}
