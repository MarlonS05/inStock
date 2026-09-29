import 'package:instock/domain/repositories/product_repository.dart';

class FinishProductUseCase {
  FinishProductUseCase(this._productRepository);

  final ProductRepository _productRepository;

  Future<void> call(String productId) => _productRepository.finish(productId);
}
