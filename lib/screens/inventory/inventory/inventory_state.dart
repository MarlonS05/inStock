import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instock/domain/entities/material.dart';

part 'inventory_state.freezed.dart';

enum InventoryStatus { initial, loading, loaded, saving, failure }

@freezed
abstract class MaterialListItem with _$MaterialListItem {
  const MaterialListItem._();

  const factory MaterialListItem({
    required Material material,
    required double availableQuantity,
  }) = _MaterialListItem;

  double get reservedQuantity => material.quantity - availableQuantity;

  bool get isLowStock => availableQuantity <= 0;

  bool get hasReservedStock => reservedQuantity > 0;
}

@freezed
abstract class InventoryState with _$InventoryState {
  const InventoryState._();

  const factory InventoryState({
    @Default(InventoryStatus.initial) InventoryStatus status,
    @Default([]) List<MaterialListItem> items,
    @Default('') String searchQuery,
    String? errorMessage,
    @Default(false) bool isMaterialInUse,
    String? pickedImageMaterialId,
    Uint8List? pickedImageBytes,
    @Default(false) bool imagePickFailed,
  }) = _InventoryState;

  List<MaterialListItem> get visibleItems {
    if (searchQuery.isEmpty) {
      return items;
    }

    final query = searchQuery.toLowerCase();
    return items
        .where(
          (item) =>
              item.material.title.toLowerCase().contains(query) ||
              item.material.description.toLowerCase().contains(query),
        )
        .toList();
  }
}
