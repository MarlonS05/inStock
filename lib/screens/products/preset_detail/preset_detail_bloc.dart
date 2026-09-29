import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/repositories/preset_repository.dart';
import 'package:instock/domain/services/preset_image_service.dart';
import 'package:instock/domain/use_cases/product/add_product_to_workbench_use_case.dart';
import 'package:instock/domain/use_cases/preset/create_or_update_preset_use_case.dart';
import 'package:instock/domain/use_cases/preset/delete_preset_material_use_case.dart';
import 'package:instock/domain/use_cases/preset/delete_preset_use_case.dart';
import 'package:instock/domain/use_cases/preset/save_preset_material_use_case.dart';
import 'package:instock/domain/use_cases/preset/update_preset_image_use_case.dart';
import 'package:instock/domain/validators/is_untouched_preset_draft.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/router/app_router.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_event.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_state.dart';
import 'package:uuid/uuid.dart';

class PresetDetailBloc
    extends Bloc<PresetDetailEvent, PresetDetailState> {
  PresetDetailBloc(
    this._presetRepository,
    this._materialRepository,
    this._createOrUpdatePreset,
    this._updatePresetImage,
    this._savePresetMaterial,
    this._deletePresetMaterial,
    this._deletePreset,
    this._addProductToWorkbench,
    this._presetImageService,
  ) : super(const PresetDetailState()) {
    on<PresetDetailStarted>(_onStarted);
    on<PresetDetailPresetUpdated>(_onPresetUpdated);
    on<PresetDetailDeleteRequested>(_onDeleteRequested);
    on<PresetDetailImageSelected>(_onImageSelected);
    on<PresetDetailImagePickRequested>(_onImagePickRequested);
    on<PresetDetailImagePickFailureConsumed>(
      _onImagePickFailureConsumed,
    );
    on<PresetDetailQuantityChanged>(_onQuantityChanged);
    on<PresetDetailMaterialAdded>(_onMaterialAdded);
    on<PresetDetailCreateProductRequested>(_onCreateProductRequested);
    on<PresetDetailBackTapped>(_onBackTapped);
  }

  final PresetRepository _presetRepository;
  final MaterialRepository _materialRepository;
  final CreateOrUpdatePresetUseCase _createOrUpdatePreset;
  final UpdatePresetImageUseCase _updatePresetImage;
  final SavePresetMaterialUseCase _savePresetMaterial;
  final DeletePresetMaterialUseCase _deletePresetMaterial;
  final DeletePresetUseCase _deletePreset;
  final AddProductToWorkbenchUseCase _addProductToWorkbench;
  final PresetImageService _presetImageService;
  final _uuid = const Uuid();

  String? _presetId;
  String? _untouchedDraftDefaultName;

  Future<void> _onStarted(
    PresetDetailStarted event,
    Emitter<PresetDetailState> emit,
  ) async {
    _presetId = event.presetId;
    _untouchedDraftDefaultName = event.untouchedDraftDefaultName;
    await _load(emit);
  }

  Future<void> _onPresetUpdated(
    PresetDetailPresetUpdated event,
    Emitter<PresetDetailState> emit,
  ) async {
    final preset = state.preset;
    if (preset == null) {
      return;
    }

    final trimmedName = event.name.trim();
    if (trimmedName.isEmpty) {
      return;
    }

    final trimmedDescription = event.description.trim();
    if (trimmedName == preset.name &&
        trimmedDescription == preset.description) {
      return;
    }

    emit(
      state.copyWith(
        status: PresetDetailStatus.saving,
        errorMessage: null,
        createdProductId: null,
      ),
    );

    try {
      final updated = preset.copyWith(
        name: trimmedName,
        description: trimmedDescription,
      );
      await _createOrUpdatePreset(updated);
      logger.i('Success saved preset ${updated.id}');
      emit(
        state.copyWith(
          status: PresetDetailStatus.loaded,
          preset: updated,
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed saved preset: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: PresetDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  Future<void> _onImageSelected(
    PresetDetailImageSelected event,
    Emitter<PresetDetailState> emit,
  ) async {
    final preset = state.preset;
    if (preset == null) {
      return;
    }

    emit(
      state.copyWith(
        status: PresetDetailStatus.saving,
        errorMessage: null,
        createdProductId: null,
        imagePickFailed: false,
      ),
    );

    try {
      final updated = await _updatePresetImage(preset, event.bytes);
      logger.i('Success updated preset image ${updated.id}');
      emit(
        state.copyWith(
          status: PresetDetailStatus.loaded,
          preset: updated,
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed updated preset image: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: PresetDetailStatus.loaded,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  Future<void> _onImagePickRequested(
    PresetDetailImagePickRequested event,
    Emitter<PresetDetailState> emit,
  ) async {
    try {
      final bytes = await _presetImageService.pickImageBytes();
      if (bytes == null) {
        return;
      }

      await _onImageSelected(PresetDetailImageSelected(bytes), emit);
    } on PlatformException {
      emit(state.copyWith(imagePickFailed: true));
    }
  }

  void _onImagePickFailureConsumed(
    PresetDetailImagePickFailureConsumed event,
    Emitter<PresetDetailState> emit,
  ) {
    emit(state.copyWith(imagePickFailed: false));
  }

  Future<void> _onDeleteRequested(
    PresetDetailDeleteRequested event,
    Emitter<PresetDetailState> emit,
  ) async {
    final presetId = _presetId;
    if (presetId == null) {
      return;
    }

    emit(
      state.copyWith(
        status: PresetDetailStatus.saving,
        errorMessage: null,
        createdProductId: null,
      ),
    );

    try {
      await _deletePreset(presetId);
      logger.i('Success deleted preset $presetId');
      emit(
        state.copyWith(
          status: PresetDetailStatus.deleted,
          errorMessage: null,
        ),
      );
      popRoute();
    } catch (error, stackTrace) {
      logger.w('Failed deleted preset: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: PresetDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  Future<void> _onQuantityChanged(
    PresetDetailQuantityChanged event,
    Emitter<PresetDetailState> emit,
  ) async {
    final presetId = _presetId;
    if (presetId == null) {
      return;
    }

    emit(
      state.copyWith(
        status: PresetDetailStatus.saving,
        errorMessage: null,
        createdProductId: null,
      ),
    );

    try {
      if (event.quantity <= 0) {
        await _deletePresetMaterial(event.lineId);
        logger.i('Success removed product material ${event.lineId}');
      } else {
        final existing = state.materialLines
            .firstWhere((line) => line.line.id == event.lineId)
            .line;
        await _savePresetMaterial(existing.copyWith(quantity: event.quantity));
        logger.i('Success updated product material ${event.lineId}');
      }
      await _load(emit, showLoading: false);
    } catch (error, stackTrace) {
      logger.w('Failed updated product material: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: PresetDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  Future<void> _onMaterialAdded(
    PresetDetailMaterialAdded event,
    Emitter<PresetDetailState> emit,
  ) async {
    final presetId = _presetId;
    if (presetId == null) {
      return;
    }

    emit(
      state.copyWith(
        status: PresetDetailStatus.saving,
        errorMessage: null,
        createdProductId: null,
      ),
    );

    try {
      final line = PresetMaterial(
        id: _uuid.v4(),
        materialId: event.materialId,
        presetId: presetId,
        quantity: 1,
      );
      await _savePresetMaterial(line);
      logger.i('Success added product material ${line.id}');
      await _load(emit, showLoading: false);
    } catch (error, stackTrace) {
      logger.w('Failed added product material: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: PresetDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  Future<void> _onCreateProductRequested(
    PresetDetailCreateProductRequested event,
    Emitter<PresetDetailState> emit,
  ) async {
    final presetId = _presetId;
    if (presetId == null) {
      return;
    }

    emit(
      state.copyWith(
        status: PresetDetailStatus.saving,
        errorMessage: null,
        createdProductId: null,
      ),
    );

    try {
      final product = await _addProductToWorkbench(
        presetId: presetId,
        customer: '',
      );
      logger.i('Success created product ${product.id} from preset $presetId');
      emit(
        state.copyWith(
          status: PresetDetailStatus.loaded,
          createdProductId: product.id,
          errorMessage: null,
        ),
      );

      replaceWithProductDetail(product.id);
      emit(state.copyWith(createdProductId: null));
    } catch (error, stackTrace) {
      logger.w('Failed created product from preset: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: PresetDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
          createdProductId: null,
        ),
      );
    }
  }

  Future<void> _onBackTapped(
    PresetDetailBackTapped event,
    Emitter<PresetDetailState> emit,
  ) async {
    final defaultName = _untouchedDraftDefaultName;
    final preset = state.preset;
    final presetId = _presetId;
    if (defaultName != null &&
        preset != null &&
        presetId != null &&
        isUntouchedPresetDraft(
          preset: preset,
          bomLines: state.materialLines.map((e) => e.line),
          defaultName: defaultName,
        )) {
      try {
        await _deletePreset(presetId);
        logger.i('Success discarded untouched preset $presetId');
      } catch (error, stackTrace) {
        logger.w('Failed discarded preset: $error\n$stackTrace');
        emit(
          state.copyWith(
            status: PresetDetailStatus.failure,
            errorMessage: UiErrorCodes.actionFailure,
          ),
        );
        return;
      }
    }
    popRoute();
  }

  Future<void> _load(
    Emitter<PresetDetailState> emit, {
    bool showLoading = true,
  }) async {
    final presetId = _presetId;
    if (presetId == null) {
      return;
    }

    if (showLoading) {
      emit(
        state.copyWith(
          status: PresetDetailStatus.loading,
          errorMessage: null,
          createdProductId: null,
        ),
      );
    }

    try {
      final preset = await _presetRepository.getById(presetId);
      if (preset == null) {
        emit(
          state.copyWith(
            status: PresetDetailStatus.failure,
            errorMessage: UiErrorCodes.notFound,
          ),
        );
        return;
      }

      final bomLines = await _presetRepository.getMaterials(presetId);
      final allMaterials = await _materialRepository.getAll();
      final materialById = {for (final m in allMaterials) m.id: m};

      final lines =
          bomLines
              .map(
                (line) => PresetMaterialLine(
                  line: line,
                  materialTitle:
                      materialById[line.materialId]?.title ?? line.materialId,
                ),
              )
              .toList()
            ..sort(
              (a, b) => a.materialTitle.toLowerCase().compareTo(
                b.materialTitle.toLowerCase(),
              ),
            );

      emit(
        state.copyWith(
          status: PresetDetailStatus.loaded,
          preset: preset,
          materialLines: lines,
          allMaterials: allMaterials,
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed loaded preset detail: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: PresetDetailStatus.failure,
          errorMessage: UiErrorCodes.loadFailure,
        ),
      );
    }
  }
}
