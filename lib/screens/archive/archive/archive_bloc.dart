import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/router/app_router.dart';
import 'package:instock/screens/archive/archive/archive_event.dart';
import 'package:instock/screens/archive/archive/archive_state.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';

class ArchiveBloc extends Bloc<ArchiveEvent, ArchiveState> {
  ArchiveBloc(this._productRepository) : super(ArchiveState.initial()) {
    on<ArchiveStarted>(_onStarted);
    on<ArchiveRefreshRequested>(_onRefreshRequested);
    on<ArchiveStartDateChanged>(_onStartDateChanged);
    on<ArchiveEndDateChanged>(_onEndDateChanged);
    on<ArchiveBackTapped>(_onBackTapped);
  }

  final ProductRepository _productRepository;

  Future<void> _onStarted(
    ArchiveStarted event,
    Emitter<ArchiveState> emit,
  ) async {
    await _loadProducts(emit);
  }

  Future<void> _onRefreshRequested(
    ArchiveRefreshRequested event,
    Emitter<ArchiveState> emit,
  ) async {
    await _loadProducts(emit);
  }

  Future<void> _onStartDateChanged(
    ArchiveStartDateChanged event,
    Emitter<ArchiveState> emit,
  ) async {
    final normalized = _startOfDay(event.date);
    var startDate = normalized;
    var endDate = state.endDate;
    if (startDate.isAfter(endDate)) {
      endDate = startDate;
    }
    emit(
      state.copyWith(
        startDate: startDate,
        endDate: endDate,
        errorMessage: null,
      ),
    );
    await _loadProducts(emit);
  }

  Future<void> _onEndDateChanged(
    ArchiveEndDateChanged event,
    Emitter<ArchiveState> emit,
  ) async {
    final normalized = _startOfDay(event.date);
    var endDate = normalized;
    var startDate = state.startDate;
    if (endDate.isBefore(startDate)) {
      startDate = endDate;
    }
    emit(
      state.copyWith(
        startDate: startDate,
        endDate: endDate,
        errorMessage: null,
      ),
    );
    await _loadProducts(emit);
  }

  void _onBackTapped(ArchiveBackTapped event, Emitter<ArchiveState> emit) {
    popRoute();
  }

  Future<void> _loadProducts(Emitter<ArchiveState> emit) async {
    emit(state.copyWith(status: ArchiveStatus.loading, errorMessage: null));

    try {
      final products = await _productRepository.getFinishedBetween(
        startInclusive: _startOfDay(state.startDate),
        endInclusive: _endOfDay(state.endDate),
      );

      emit(
        state.copyWith(
          status: ArchiveStatus.loaded,
          products: products,
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed to load archived products: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ArchiveStatus.failure,
          errorMessage: UiErrorCodes.loadFailure,
        ),
      );
    }
  }

  DateTime _startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  DateTime _endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
}
