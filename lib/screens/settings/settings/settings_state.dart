import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

enum SettingsStatus { idle, seeding, wiping, success, failure }

enum SettingsDevAction { seed, wipe }

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(SettingsStatus.idle) SettingsStatus status,
    SettingsDevAction? lastAction,
    String? errorMessage,
  }) = _SettingsState;
}
