import 'package:equatable/equatable.dart';

class PresetMaterial extends Equatable {
  const PresetMaterial({
    required this.id,
    required this.materialId,
    required this.presetId,
    required this.quantity,
  });

  final String id;
  final String materialId;
  final String presetId;
  final double quantity;

  PresetMaterial copyWith({
    String? id,
    String? materialId,
    String? presetId,
    double? quantity,
  }) {
    return PresetMaterial(
      id: id ?? this.id,
      materialId: materialId ?? this.materialId,
      presetId: presetId ?? this.presetId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, materialId, presetId, quantity];
}
