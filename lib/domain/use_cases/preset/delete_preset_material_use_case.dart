import 'package:instock/domain/repositories/preset_repository.dart';

class DeletePresetMaterialUseCase {
  DeletePresetMaterialUseCase(this._repository);

  final PresetRepository _repository;

  Future<void> call(String id) => _repository.deleteMaterial(id);
}
