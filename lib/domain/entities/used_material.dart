import 'package:equatable/equatable.dart';
import 'package:instock/domain/entities/preset_material.dart';

class UsedMaterial extends Equatable {
  const UsedMaterial({
    required this.id,
    required this.productId,
    required this.materialId,
    required this.quantity,
  });

  final String id;
  final String productId;
  final String materialId;
  final double quantity;

  /// Snapshot a preset BOM line onto a workbench product.
  factory UsedMaterial.fromPresetMaterial({
    required String id,
    required String productId,
    required PresetMaterial source,
  }) {
    return UsedMaterial(
      id: id,
      productId: productId,
      materialId: source.materialId,
      quantity: source.quantity,
    );
  }

  UsedMaterial copyWith({
    String? id,
    String? productId,
    String? materialId,
    double? quantity,
  }) {
    return UsedMaterial(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      materialId: materialId ?? this.materialId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, productId, materialId, quantity];
}
