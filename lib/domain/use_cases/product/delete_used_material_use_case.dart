import 'package:instock/domain/repositories/product_repository.dart';

class DeleteUsedMaterialUseCase {
  DeleteUsedMaterialUseCase(this._productRepository);

  final ProductRepository _productRepository;

  Future<void> call(String id) => _productRepository.deleteUsedMaterial(id);
}
