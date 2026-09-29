import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/use_cases/database/wipe_database_use_case.dart';
import 'package:instock/domain/use_cases/seed/seed_database_use_case.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/settings/settings/settings_event.dart';
import 'package:instock/screens/settings/settings/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this._seedDatabase, this._wipeDatabase)
      : super(const SettingsState()) {
    on<SettingsSeedDatabaseRequested>(_onSeedDatabaseRequested);
    on<SettingsWipeDatabaseRequested>(_onWipeDatabaseRequested);
  }

  final SeedDatabaseUseCase _seedDatabase;
  final WipeDatabaseUseCase _wipeDatabase;

  Future<void> _onSeedDatabaseRequested(
    SettingsSeedDatabaseRequested event,
    Emitter<SettingsState> emit,
  ) async {
    if (state.status == SettingsStatus.seeding ||
        state.status == SettingsStatus.wiping) {
      return;
    }

    emit(
      state.copyWith(
        status: SettingsStatus.seeding,
        lastAction: SettingsDevAction.seed,
        errorMessage: null,
      ),
    );

    try {
      await _seedDatabase();
      logger.i('Success seeded database from settings');
      emit(state.copyWith(status: SettingsStatus.success, errorMessage: null));
    } catch (error, stackTrace) {
      logger.w(
        'Failed seeded database from settings: $error\n$stackTrace',
      );
      emit(
        state.copyWith(
          status: SettingsStatus.failure,
          errorMessage: UiErrorCodes.seedFailure,
        ),
      );
    }
  }

  Future<void> _onWipeDatabaseRequested(
    SettingsWipeDatabaseRequested event,
    Emitter<SettingsState> emit,
  ) async {
    if (state.status == SettingsStatus.seeding ||
        state.status == SettingsStatus.wiping) {
      return;
    }

    emit(
      state.copyWith(
        status: SettingsStatus.wiping,
        lastAction: SettingsDevAction.wipe,
        errorMessage: null,
      ),
    );

    try {
      await _wipeDatabase();
      logger.i('Success wiped database from settings');
      emit(state.copyWith(status: SettingsStatus.success, errorMessage: null));
    } catch (error, stackTrace) {
      logger.w('Failed wiped database from settings: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: SettingsStatus.failure,
          errorMessage: UiErrorCodes.wipeFailure,
        ),
      );
    }
  }
}
