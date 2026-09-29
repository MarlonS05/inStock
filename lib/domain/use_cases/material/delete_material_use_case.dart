import 'package:instock/domain/repositories/material_repository.dart';

class DeleteMaterialUseCase {
  DeleteMaterialUseCase(this._repository);

  final MaterialRepository _repository;

  Future<void> call(String id) => _repository.delete(id);
}
