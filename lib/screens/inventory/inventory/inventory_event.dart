import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_event.freezed.dart';

@freezed
sealed class InventoryEvent with _$InventoryEvent {
  const factory InventoryEvent.started() = InventoryStarted;

  const factory InventoryEvent.refreshRequested() = InventoryRefreshRequested;

  const factory InventoryEvent.searchChanged(String query) =
      InventorySearchChanged;

  const factory InventoryEvent.materialSaved({
    String? id,
    required String title,
    required String description,
    required double quantity,
  }) = InventoryMaterialSaved;

  const factory InventoryEvent.materialImageSelected({
    required String materialId,
    required Uint8List bytes,
  }) = InventoryMaterialImageSelected;

  const factory InventoryEvent.materialImagePickRequested(String materialId) =
      InventoryMaterialImagePickRequested;

  const factory InventoryEvent.pickedImagePreviewConsumed() =
      InventoryPickedImagePreviewConsumed;

  const factory InventoryEvent.imagePickFailureConsumed() =
      InventoryImagePickFailureConsumed;

  const factory InventoryEvent.materialDeleteRequested(String id) =
      InventoryMaterialDeleteRequested;
}
