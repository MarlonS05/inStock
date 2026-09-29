import 'package:instock/domain/repositories/product_repository.dart';

/// Removes a workbench build and releases its material reservations.
///
/// Does not subtract from on-hand inventory (unlike [FinishProductUseCase]).
class DeleteProductUseCase {
  DeleteProductUseCase(this._productRepository);

  final ProductRepository _productRepository;

  Future<void> call(String id) => _productRepository.delete(id);
}
