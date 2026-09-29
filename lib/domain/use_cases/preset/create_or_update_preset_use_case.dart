import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/repositories/preset_repository.dart';

class CreateOrUpdatePresetUseCase {
  CreateOrUpdatePresetUseCase(this._repository);

  final PresetRepository _repository;

  Future<void> call(Preset preset) => _repository.save(preset);
}
