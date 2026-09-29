import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/models/database_bootstrap_status.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/use_cases/database/retry_database_use_case.dart';
import 'package:instock/domain/use_cases/database/wipe_database_use_case.dart';
import 'package:instock/domain/use_cases/material/add_material_stock_use_case.dart';
import 'package:instock/domain/use_cases/quote/pick_daily_quote_use_case.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/home/home/home_event.dart';
import 'package:instock/screens/home/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._pickDailyQuote,
    this._materialRepository,
    this._addMaterialStock,
    this._bootstrap,
    this._retryDatabase,
    this._wipeDatabase,
  ) : _databaseReady = _bootstrap.isReady,
      super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeRefreshRequested>(_onRefreshRequested);
    on<HomeMaterialPurchased>(_onMaterialPurchased);
    on<HomeDatabaseRetryRequested>(_onDatabaseRetryRequested);
    on<HomeDatabaseWipeRequested>(_onDatabaseWipeRequested);
  }

  final PickDailyQuoteUseCase _pickDailyQuote;
  final MaterialRepository _materialRepository;
  final AddMaterialStockUseCase _addMaterialStock;
  final DatabaseBootstrapStatus _bootstrap;
  final RetryDatabaseUseCase _retryDatabase;
  final WipeDatabaseUseCase _wipeDatabase;
  bool _databaseReady;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        status: HomeStatus.ready,
        quoteIndex: _pickDailyQuote(),
        errorMessage: null,
      ),
    );
    if (!_databaseReady) {
      logger.w('Failed database bootstrap: ${_bootstrap.cause}');
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: UiErrorCodes.databaseOpenFailure,
        ),
      );
      return;
    }
    await _loadShoppingList(emit);
  }

  Future<void> _onRefreshRequested(
    HomeRefreshRequested event,
    Emitter<HomeState> emit,
  ) async {
    if (!_databaseReady) {
      emit(state.copyWith(errorMessage: null));
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: UiErrorCodes.databaseOpenFailure,
        ),
      );
      return;
    }
    await _loadShoppingList(emit);
  }

  Future<void> _onMaterialPurchased(
    HomeMaterialPurchased event,
    Emitter<HomeState> emit,
  ) async {
    if (!_databaseReady) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: UiErrorCodes.databaseOpenFailure,
        ),
      );
      return;
    }

    emit(state.copyWith(errorMessage: null));

    try {
      await _addMaterialStock(
        materialId: event.materialId,
        quantity: event.quantity,
      );
      logger.i(
        'Success added ${event.quantity} to material ${event.materialId}',
      );
      await _loadShoppingList(emit);
    } catch (error, stackTrace) {
      logger.w('Failed added material stock: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: UiErrorCodes.purchaseFailure,
        ),
      );
    }
  }

  Future<void> _onDatabaseRetryRequested(
    HomeDatabaseRetryRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _retryDatabase();
      logger.i('Success retried database open');
      _databaseReady = true;
      await _loadShoppingList(emit);
    } catch (error, stackTrace) {
      logger.w('Failed retried database open: $error\n$stackTrace');
      emit(state.copyWith(errorMessage: null));
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: UiErrorCodes.databaseOpenFailure,
        ),
      );
    }
  }

  Future<void> _onDatabaseWipeRequested(
    HomeDatabaseWipeRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _wipeDatabase();
      logger.i('Success wiped database');
      _databaseReady = true;
      await _loadShoppingList(emit);
    } catch (error, stackTrace) {
      logger.w('Failed wiped database: $error\n$stackTrace');
      emit(state.copyWith(errorMessage: null));
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: UiErrorCodes.databaseOpenFailure,
        ),
      );
    }
  }

  Future<void> _loadShoppingList(Emitter<HomeState> emit) async {
    try {
      final materials = await _materialRepository.getAll();
      final reservedById = await _materialRepository
          .getReservedQuantitiesByMaterialId();
      final items = <ShoppingListItem>[];

      for (final material in materials) {
        final reserved = reservedById[material.id] ?? 0;
        final available = material.quantity - reserved;
        if (available <= 0) {
          items.add(
            ShoppingListItem(
              material: material,
              availableQuantity: available,
              requiredQuantity: reserved,
            ),
          );
        }
      }

      items.sort(
        (a, b) => a.material.title.toLowerCase().compareTo(
          b.material.title.toLowerCase(),
        ),
      );

      emit(
        state.copyWith(
          status: HomeStatus.ready,
          shoppingList: items,
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed loaded shopping list: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: UiErrorCodes.loadFailure,
        ),
      );
    }
  }
}
