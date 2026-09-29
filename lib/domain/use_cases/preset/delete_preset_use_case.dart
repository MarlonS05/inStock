import 'package:instock/domain/repositories/preset_repository.dart';

class DeletePresetUseCase {
  DeletePresetUseCase(this._repository);

  final PresetRepository _repository;

  Future<void> call(String id) => _repository.delete(id);
}
