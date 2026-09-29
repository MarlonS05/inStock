import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/models/material_in_use_exception.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/services/material_image_service.dart';
import 'package:instock/domain/use_cases/material/create_or_update_material_use_case.dart';
import 'package:instock/domain/use_cases/material/delete_material_use_case.dart';
import 'package:instock/domain/use_cases/material/update_material_image_use_case.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/inventory/inventory/inventory_event.dart';
import 'package:instock/screens/inventory/inventory/inventory_state.dart';
import 'package:uuid/uuid.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc(
    this._materialRepository,
    this._createOrUpdateMaterial,
    this._deleteMaterial,
    this._updateMaterialImage,
    this._materialImageService,
  ) : super(const InventoryState()) {
    on<InventoryStarted>(_onStarted);
    on<InventoryRefreshRequested>(_onRefreshRequested);
    on<InventorySearchChanged>(_onSearchChanged);
    on<InventoryMaterialSaved>(_onMaterialSaved);
    on<InventoryMaterialImageSelected>(_onMaterialImageSelected);
    on<InventoryMaterialImagePickRequested>(_onMaterialImagePickRequested);
    on<InventoryPickedImagePreviewConsumed>(_onPickedImagePreviewConsumed);
    on<InventoryImagePickFailureConsumed>(_onImagePickFailureConsumed);
    on<InventoryMaterialDeleteRequested>(_onMaterialDeleteRequested);
  }

  final MaterialRepository _materialRepository;
  final CreateOrUpdateMaterialUseCase _createOrUpdateMaterial;
  final DeleteMaterialUseCase _deleteMaterial;
  final UpdateMaterialImageUseCase _updateMaterialImage;
  final MaterialImageService _materialImageService;
  final _uuid = const Uuid();

  Future<void> _onStarted(
    InventoryStarted event,
    Emitter<InventoryState> emit,
  ) async {
    await _loadMaterials(emit);
  }

  Future<void> _onRefreshRequested(
    InventoryRefreshRequested event,
    Emitter<InventoryState> emit,
  ) async {
    await _loadMaterials(emit);
  }

  void _onSearchChanged(
    InventorySearchChanged event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }

  Future<void> _onMaterialSaved(
    InventoryMaterialSaved event,
    Emitter<InventoryState> emit,
  ) async {
    emit(
      state.copyWith(
        status: InventoryStatus.saving,
        errorMessage: null,
        isMaterialInUse: false,
      ),
    );

    try {
      final existingId = event.id;
      final existingImage = existingId == null
          ? null
          : (await _materialRepository.getById(existingId))?.image;
      final material = Material(
        id: existingId ?? _uuid.v4(),
        title: event.title.trim(),
        description: event.description.trim(),
        quantity: event.quantity,
        image: existingImage,
      );
      await _createOrUpdateMaterial(material);
      logger.i('Success saved material ${material.id}');
      await _loadMaterials(emit);
    } catch (error, stackTrace) {
      logger.w('Failed saved material: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: InventoryStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
          isMaterialInUse: false,
        ),
      );
    }
  }

  Future<void> _onMaterialImageSelected(
    InventoryMaterialImageSelected event,
    Emitter<InventoryState> emit,
  ) async {
    final material = await _materialRepository.getById(event.materialId);
    if (material == null) {
      return;
    }

    emit(
      state.copyWith(
        status: InventoryStatus.saving,
        errorMessage: null,
        isMaterialInUse: false,
        pickedImageMaterialId: event.materialId,
        pickedImageBytes: event.bytes,
        imagePickFailed: false,
      ),
    );

    try {
      final updated = await _updateMaterialImage(material, event.bytes);
      logger.i('Success updated material image ${updated.id}');
      await _loadMaterials(emit);
    } catch (error, stackTrace) {
      logger.w('Failed updated material image: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: InventoryStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
          isMaterialInUse: false,
        ),
      );
    }
  }

  Future<void> _onMaterialImagePickRequested(
    InventoryMaterialImagePickRequested event,
    Emitter<InventoryState> emit,
  ) async {
    try {
      final bytes = await _materialImageService.pickImageBytes();
      if (bytes == null) {
        return;
      }

      await _onMaterialImageSelected(
        InventoryMaterialImageSelected(
          materialId: event.materialId,
          bytes: bytes,
        ),
        emit,
      );
    } on PlatformException {
      emit(state.copyWith(imagePickFailed: true));
    }
  }

  void _onPickedImagePreviewConsumed(
    InventoryPickedImagePreviewConsumed event,
    Emitter<InventoryState> emit,
  ) {
    emit(
      state.copyWith(
        pickedImageMaterialId: null,
        pickedImageBytes: null,
      ),
    );
  }

  void _onImagePickFailureConsumed(
    InventoryImagePickFailureConsumed event,
    Emitter<InventoryState> emit,
  ) {
    emit(state.copyWith(imagePickFailed: false));
  }

  Future<void> _onMaterialDeleteRequested(
    InventoryMaterialDeleteRequested event,
    Emitter<InventoryState> emit,
  ) async {
    emit(
      state.copyWith(
        status: InventoryStatus.saving,
        errorMessage: null,
        isMaterialInUse: false,
      ),
    );

    try {
      await _deleteMaterial(event.id);
      logger.i('Success deleted material ${event.id}');
      await _loadMaterials(emit);
    } on MaterialInUseException catch (error, stackTrace) {
      logger.w('Failed deleted material: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: InventoryStatus.failure,
          errorMessage: UiErrorCodes.materialInUse,
          isMaterialInUse: true,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed deleted material: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: InventoryStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
          isMaterialInUse: false,
        ),
      );
    }
  }

  Future<void> _loadMaterials(Emitter<InventoryState> emit) async {
    emit(
      state.copyWith(
        status: InventoryStatus.loading,
        errorMessage: null,
        isMaterialInUse: false,
      ),
    );

    try {
      final materials = await _materialRepository.getAll();
      materials.sort(
        (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
      );

      final reservedById =
          await _materialRepository.getReservedQuantitiesByMaterialId();
      final items = [
        for (final material in materials)
          MaterialListItem(
            material: material,
            availableQuantity:
                material.quantity - (reservedById[material.id] ?? 0),
          ),
      ];

      emit(
        state.copyWith(
          status: InventoryStatus.loaded,
          items: items,
          errorMessage: null,
          isMaterialInUse: false,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed loaded inventory: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: InventoryStatus.failure,
          errorMessage: UiErrorCodes.loadFailure,
          isMaterialInUse: false,
        ),
      );
    }
  }
}
