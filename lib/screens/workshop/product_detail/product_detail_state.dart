import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';

part 'product_detail_state.freezed.dart';

enum ProductDetailStatus {
  initial,
  loading,
  loaded,
  saving,
  failure,
}

@freezed
abstract class ProductMaterialLine with _$ProductMaterialLine {
  const ProductMaterialLine._();

  const factory ProductMaterialLine({
    required UsedMaterial line,
    required String materialTitle,
    required double onHandQuantity,
    required double globalReservedQuantity,
  }) = _ProductMaterialLine;

  double get availableQuantity => onHandQuantity - globalReservedQuantity;

  bool get isShortage => globalReservedQuantity > onHandQuantity;
}

@freezed
abstract class ProductDetailState with _$ProductDetailState {
  const ProductDetailState._();

  const factory ProductDetailState({
    @Default(ProductDetailStatus.initial) ProductDetailStatus status,
    Product? product,
    @Default([]) List<ProductMaterialLine> materialLines,
    @Default([]) List<Material> allMaterials,
    String? errorMessage,
    @Default(false) bool isFinishFailure,
  }) = _ProductDetailState;

  bool get isEditable =>
      product != null && product!.state == ProductState.workbench;

  List<Material> get addableMaterials {
    final usedIds = materialLines.map((line) => line.line.materialId).toSet();
    return allMaterials
        .where((material) => !usedIds.contains(material.id))
        .toList();
  }
}
