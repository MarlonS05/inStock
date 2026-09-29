import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';

part 'preset_detail_state.freezed.dart';

enum PresetDetailStatus {
  initial,
  loading,
  loaded,
  saving,
  failure,
  deleted,
}

@freezed
abstract class PresetMaterialLine with _$PresetMaterialLine {
  const factory PresetMaterialLine({
    required PresetMaterial line,
    required String materialTitle,
  }) = _PresetMaterialLine;
}

@freezed
abstract class PresetDetailState with _$PresetDetailState {
  const PresetDetailState._();

  const factory PresetDetailState({
    @Default(PresetDetailStatus.initial)
    PresetDetailStatus status,
    Preset? preset,
    @Default([]) List<PresetMaterialLine> materialLines,
    @Default([]) List<Material> allMaterials,
    String? errorMessage,
    String? createdProductId,
    @Default(false) bool imagePickFailed,
  }) = _PresetDetailState;

  List<Material> get addableMaterials {
    final usedIds = materialLines.map((line) => line.line.materialId).toSet();
    return allMaterials
        .where((material) => !usedIds.contains(material.id))
        .toList();
  }
}
