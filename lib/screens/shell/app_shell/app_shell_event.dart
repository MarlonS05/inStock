import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_shell_event.freezed.dart';

@freezed
sealed class AppShellEvent with _$AppShellEvent {
  const factory AppShellEvent.started(int initialIndex) = AppShellStarted;

  const factory AppShellEvent.tabSelected(int index) = AppShellTabSelected;

  const factory AppShellEvent.pageChanged(int index) = AppShellPageChanged;

  const factory AppShellEvent.routeChanged(int index) = AppShellRouteChanged;
}
