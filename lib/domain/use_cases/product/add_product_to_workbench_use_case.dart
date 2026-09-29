import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/repositories/preset_repository.dart';
import 'package:instock/domain/repositories/product_repository.dart';

/// Creates a workbench product from a preset, reserving BOM quantities.
///
/// Stock is not gated: over-reservation is allowed. Materials with available
/// stock ≤ 0 then appear on the home shopping list.
class AddProductToWorkbenchUseCase {
  AddProductToWorkbenchUseCase(this._presetRepository, this._productRepository);

  final PresetRepository _presetRepository;
  final ProductRepository _productRepository;

  Future<Product> call({
    required String presetId,
    required String customer,
  }) async {
    final preset = await _presetRepository.getById(presetId);
    if (preset == null) {
      throw StateError('Product preset not found: $presetId');
    }

    final bom = await _presetRepository.getMaterials(presetId);
    return _productRepository.addToWorkbench(
      preset: preset,
      bom: bom,
      customer: customer,
    );
  }
}
