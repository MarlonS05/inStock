import 'package:equatable/equatable.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/models/product_state.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.state,
    required this.presetId,
    required this.presetName,
    required this.presetDescription,
    required this.customer,
    required this.updatedAt,
  });

  final String id;
  final ProductState state;
  final String presetId;
  final String presetName;
  final String presetDescription;
  final String customer;
  final DateTime updatedAt;

  /// Snapshot preset display fields onto a workbench product.
  factory Product.fromPreset({
    required String id,
    required ProductState state,
    required Preset source,
    required String customer,
    required DateTime updatedAt,
  }) {
    return Product(
      id: id,
      state: state,
      presetId: source.id,
      presetName: source.name,
      presetDescription: source.description,
      customer: customer,
      updatedAt: updatedAt,
    );
  }

  Product copyWith({
    String? id,
    ProductState? state,
    String? presetId,
    String? presetName,
    String? presetDescription,
    String? customer,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      state: state ?? this.state,
      presetId: presetId ?? this.presetId,
      presetName: presetName ?? this.presetName,
      presetDescription: presetDescription ?? this.presetDescription,
      customer: customer ?? this.customer,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        state,
        presetId,
        presetName,
        presetDescription,
        customer,
        updatedAt,
      ];
}
