import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_event.freezed.dart';

@freezed
sealed class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.started() = ProductsStarted;

  const factory ProductsEvent.refreshRequested() = ProductsRefreshRequested;

  const factory ProductsEvent.searchChanged(String query) =
      ProductsSearchChanged;

  const factory ProductsEvent.presetSaved({
    String? id,
    required String name,
    required String description,
  }) = ProductsPresetSaved;

  const factory ProductsEvent.presetDeleteRequested(String id) =
      ProductsPresetDeleteRequested;

  const factory ProductsEvent.openPresetDetailTapped(String presetId) =
      ProductsOpenPresetDetailTapped;

  const factory ProductsEvent.createAndOpenPresetTapped({
    required String defaultName,
  }) = ProductsCreateAndOpenPresetTapped;
}
