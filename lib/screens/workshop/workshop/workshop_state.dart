import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/models/product_state.dart';

part 'workshop_state.freezed.dart';

enum WorkshopStatus { initial, loading, loaded, failure }

@freezed
abstract class WorkshopProjectItem with _$WorkshopProjectItem {
  const WorkshopProjectItem._();

  const factory WorkshopProjectItem({
    required Product product,
    required bool hasMaterialShortage,
  }) = _WorkshopProjectItem;

  bool get isActive => product.state == ProductState.workbench;
}

@freezed
abstract class WorkshopState with _$WorkshopState {
  const factory WorkshopState({
    @Default(WorkshopStatus.initial) WorkshopStatus status,
    @Default([]) List<WorkshopProjectItem> projects,
    String? errorMessage,
  }) = _WorkshopState;
}
