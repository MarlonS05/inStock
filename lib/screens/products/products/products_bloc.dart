import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/repositories/preset_repository.dart';
import 'package:instock/domain/use_cases/preset/create_or_update_preset_use_case.dart';
import 'package:instock/domain/use_cases/preset/delete_preset_use_case.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/router/app_router.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/products/products/products_event.dart';
import 'package:instock/screens/products/products/products_state.dart';
import 'package:uuid/uuid.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(
    this._presetRepository,
    this._createOrUpdatePreset,
    this._deletePreset,
  ) : super(const ProductsState()) {
    on<ProductsStarted>(_onStarted);
    on<ProductsRefreshRequested>(_onRefreshRequested);
    on<ProductsSearchChanged>(_onSearchChanged);
    on<ProductsPresetSaved>(_onPresetSaved);
    on<ProductsPresetDeleteRequested>(_onPresetDeleteRequested);
    on<ProductsOpenPresetDetailTapped>(_onOpenPresetDetailTapped);
    on<ProductsCreateAndOpenPresetTapped>(_onCreateAndOpenPresetTapped);
  }

  final PresetRepository _presetRepository;
  final CreateOrUpdatePresetUseCase _createOrUpdatePreset;
  final DeletePresetUseCase _deletePreset;
  final _uuid = const Uuid();

  Future<void> _onStarted(
    ProductsStarted event,
    Emitter<ProductsState> emit,
  ) async {
    await _loadPresets(emit);
  }

  Future<void> _onRefreshRequested(
    ProductsRefreshRequested event,
    Emitter<ProductsState> emit,
  ) async {
    await _loadPresets(emit);
  }

  void _onSearchChanged(
    ProductsSearchChanged event,
    Emitter<ProductsState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }

  Future<void> _onPresetSaved(
    ProductsPresetSaved event,
    Emitter<ProductsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProductsStatus.saving,
        errorMessage: null,
        isCreateFailure: false,
      ),
    );

    try {
      final preset = Preset(
        id: event.id ?? _uuid.v4(),
        name: event.name.trim(),
        description: event.description.trim(),
      );
      await _createOrUpdatePreset(preset);
      logger.i('Success saved preset ${preset.id}');
      await _loadPresets(emit);
    } catch (error, stackTrace) {
      logger.w('Failed saved preset: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductsStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
          isCreateFailure: false,
        ),
      );
    }
  }

  Future<void> _onPresetDeleteRequested(
    ProductsPresetDeleteRequested event,
    Emitter<ProductsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProductsStatus.saving,
        errorMessage: null,
        isCreateFailure: false,
      ),
    );

    try {
      await _deletePreset(event.id);
      logger.i('Success deleted preset ${event.id}');
      await _loadPresets(emit);
    } catch (error, stackTrace) {
      logger.w('Failed deleted preset: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductsStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
          isCreateFailure: false,
        ),
      );
    }
  }

  Future<void> _onOpenPresetDetailTapped(
    ProductsOpenPresetDetailTapped event,
    Emitter<ProductsState> emit,
  ) async {
    await pushPresetDetail(event.presetId);
    if (isClosed) {
      return;
    }
    await _loadPresets(emit);
  }

  Future<void> _onCreateAndOpenPresetTapped(
    ProductsCreateAndOpenPresetTapped event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      final preset = Preset(
        id: _uuid.v4(),
        name: event.defaultName,
        description: '',
      );
      await _createOrUpdatePreset(preset);
      logger.i('Success created preset ${preset.id}');

      await pushPresetDetail(
        preset.id,
        untouchedDraftDefaultName: event.defaultName,
      );
      if (isClosed) {
        return;
      }
      await _loadPresets(emit);
    } catch (error, stackTrace) {
      logger.w('Failed created preset: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductsStatus.failure,
          errorMessage: UiErrorCodes.createFailure,
          isCreateFailure: true,
        ),
      );
    }
  }

  Future<void> _loadPresets(Emitter<ProductsState> emit) async {
    emit(
      state.copyWith(
        status: ProductsStatus.loading,
        errorMessage: null,
        isCreateFailure: false,
      ),
    );

    try {
      final presets = await _presetRepository.getAll();
      presets.sort(
        (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
      );

      final counts = await _presetRepository.getMaterialCountsByPresetId();
      final items = [
        for (final preset in presets)
          ProductListItem(
            preset: preset,
            materialCount: counts[preset.id] ?? 0,
          ),
      ];

      emit(
        state.copyWith(
          status: ProductsStatus.loaded,
          items: items,
          errorMessage: null,
          isCreateFailure: false,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed loaded presets: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductsStatus.failure,
          errorMessage: UiErrorCodes.loadFailure,
          isCreateFailure: false,
        ),
      );
    }
  }
}
