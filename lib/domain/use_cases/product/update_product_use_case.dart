import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/repositories/product_repository.dart';

class UpdateProductUseCase {
  UpdateProductUseCase(this._productRepository);

  final ProductRepository _productRepository;

  Future<void> call(Product product) => _productRepository.save(product);
}
