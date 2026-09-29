import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/router/app_router.dart';
import 'package:instock/screens/shell/app_shell/app_shell_event.dart';
import 'package:instock/screens/shell/app_shell/app_shell_state.dart';

class AppShellBloc extends Bloc<AppShellEvent, AppShellState> {
  AppShellBloc() : super(const AppShellState()) {
    on<AppShellStarted>(_onStarted);
    on<AppShellTabSelected>(_onTabSelected);
    on<AppShellPageChanged>(_onPageChanged);
    on<AppShellRouteChanged>(_onRouteChanged);
  }

  void _onStarted(AppShellStarted event, Emitter<AppShellState> emit) {
    emit(state.copyWith(currentIndex: event.initialIndex));
  }

  void _onTabSelected(AppShellTabSelected event, Emitter<AppShellState> emit) {
    if (event.index == state.currentIndex) {
      return;
    }
    emit(state.copyWith(currentIndex: event.index));
    goToShellTab(event.index);
  }

  void _onPageChanged(AppShellPageChanged event, Emitter<AppShellState> emit) {
    if (event.index == state.currentIndex) {
      return;
    }
    emit(state.copyWith(currentIndex: event.index));
    goToShellTab(event.index);
  }

  void _onRouteChanged(AppShellRouteChanged event, Emitter<AppShellState> emit) {
    if (event.index == state.currentIndex) {
      return;
    }
    emit(state.copyWith(currentIndex: event.index));
  }
}
