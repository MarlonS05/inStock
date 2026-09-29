import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instock/domain/entities/material.dart';

part 'home_state.freezed.dart';

enum HomeStatus { initial, ready, failure }

@freezed
abstract class ShoppingListItem with _$ShoppingListItem {
  const factory ShoppingListItem({
    required Material material,
    required double availableQuantity,
    required double requiredQuantity,
  }) = _ShoppingListItem;
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    int? quoteIndex,
    @Default([]) List<ShoppingListItem> shoppingList,
    String? errorMessage,
  }) = _HomeState;
}
