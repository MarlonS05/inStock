import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/repositories/preset_repository.dart';

class SavePresetMaterialUseCase {
  SavePresetMaterialUseCase(this._repository);

  final PresetRepository _repository;

  Future<void> call(PresetMaterial line) => _repository.saveMaterial(line);
}
