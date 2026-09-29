import 'package:instock/domain/repositories/material_repository.dart';

/// Adds [quantity] to the on-hand stock of an existing material.
class AddMaterialStockUseCase {
  AddMaterialStockUseCase(this._repository);

  final MaterialRepository _repository;

  Future<void> call({
    required String materialId,
    required double quantity,
  }) async {
    if (quantity <= 0) {
      throw ArgumentError.value(quantity, 'quantity', 'must be greater than 0');
    }

    final material = await _repository.getById(materialId);
    if (material == null) {
      throw StateError('Material not found: $materialId');
    }

    await _repository.save(
      material.copyWith(quantity: material.quantity + quantity),
    );
  }
}
