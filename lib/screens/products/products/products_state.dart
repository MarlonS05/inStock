import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instock/domain/entities/preset.dart';

part 'products_state.freezed.dart';

enum ProductsStatus { initial, loading, loaded, saving, failure }

@freezed
abstract class ProductListItem with _$ProductListItem {
  const factory ProductListItem({
    required Preset preset,
    required int materialCount,
  }) = _ProductListItem;
}

@freezed
abstract class ProductsState with _$ProductsState {
  const ProductsState._();

  const factory ProductsState({
    @Default(ProductsStatus.initial) ProductsStatus status,
    @Default([]) List<ProductListItem> items,
    @Default('') String searchQuery,
    String? errorMessage,
    @Default(false) bool isCreateFailure,
  }) = _ProductsState;

  List<ProductListItem> get visibleItems {
    if (searchQuery.isEmpty) {
      return items;
    }

    final query = searchQuery.toLowerCase();
    return items
        .where(
          (item) =>
              item.preset.name.toLowerCase().contains(query) ||
              item.preset.description.toLowerCase().contains(query),
        )
        .toList();
  }
}
