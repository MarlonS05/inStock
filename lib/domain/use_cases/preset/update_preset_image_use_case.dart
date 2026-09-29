import 'dart:typed_data';

import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/repositories/preset_repository.dart';
import 'package:instock/domain/services/preset_image_service.dart';

class UpdatePresetImageUseCase {
  UpdatePresetImageUseCase(this._imageService, this._presetRepository);

  final PresetImageService _imageService;
  final PresetRepository _presetRepository;

  Future<Preset> call(Preset preset, Uint8List bytes) async {
    final imagePath = await _imageService.savePresetImageBytes(preset.id, bytes);
    final updated = preset.copyWith(image: imagePath);
    await _presetRepository.save(updated);
    return updated;
  }
}
