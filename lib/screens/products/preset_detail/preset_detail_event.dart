import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'preset_detail_event.freezed.dart';

@freezed
sealed class PresetDetailEvent with _$PresetDetailEvent {
  const factory PresetDetailEvent.started(
    String presetId, {
    String? untouchedDraftDefaultName,
  }) = PresetDetailStarted;

  const factory PresetDetailEvent.quantityChanged({
    required String lineId,
    required double quantity,
  }) = PresetDetailQuantityChanged;

  const factory PresetDetailEvent.presetUpdated({
    required String name,
    required String description,
  }) = PresetDetailPresetUpdated;

  const factory PresetDetailEvent.deleteRequested() =
      PresetDetailDeleteRequested;

  const factory PresetDetailEvent.imageSelected(Uint8List bytes) =
      PresetDetailImageSelected;

  const factory PresetDetailEvent.imagePickRequested() =
      PresetDetailImagePickRequested;

  const factory PresetDetailEvent.imagePickFailureConsumed() =
      PresetDetailImagePickFailureConsumed;

  const factory PresetDetailEvent.materialAdded(String materialId) =
      PresetDetailMaterialAdded;

  const factory PresetDetailEvent.createProductRequested() =
      PresetDetailCreateProductRequested;

  const factory PresetDetailEvent.backTapped() =
      PresetDetailBackTapped;
}
