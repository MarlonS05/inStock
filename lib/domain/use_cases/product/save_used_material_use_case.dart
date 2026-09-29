import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/repositories/product_repository.dart';

/// Persists a [UsedMaterial] reservation line.
///
/// Quantity may exceed available stock (over-reservation is allowed). Callers
/// are responsible for removing lines when quantity is ≤ 0.
class SaveUsedMaterialUseCase {
  SaveUsedMaterialUseCase(this._productRepository);

  final ProductRepository _productRepository;

  Future<void> call(UsedMaterial usedMaterial) =>
      _productRepository.saveUsedMaterial(usedMaterial);
}
