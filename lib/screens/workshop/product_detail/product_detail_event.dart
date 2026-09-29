import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_event.freezed.dart';

@freezed
sealed class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.started(String productId) =
      ProductDetailStarted;

  const factory ProductDetailEvent.productUpdated({
    required String presetName,
    required String presetDescription,
    required String customer,
  }) = ProductDetailProductUpdated;

  const factory ProductDetailEvent.quantityChanged({
    required String lineId,
    required double quantity,
  }) = ProductDetailQuantityChanged;

  const factory ProductDetailEvent.materialAdded(String materialId) =
      ProductDetailMaterialAdded;

  const factory ProductDetailEvent.finishRequested() =
      ProductDetailFinishRequested;

  const factory ProductDetailEvent.removeRequested() =
      ProductDetailRemoveRequested;

  const factory ProductDetailEvent.backTapped() = ProductDetailBackTapped;
}
