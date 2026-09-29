import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/repositories/material_repository.dart';

class CreateOrUpdateMaterialUseCase {
  CreateOrUpdateMaterialUseCase(this._repository);

  final MaterialRepository _repository;

  Future<void> call(Material material) => _repository.save(material);
}
