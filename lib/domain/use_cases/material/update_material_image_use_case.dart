import 'dart:typed_data';

import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/services/material_image_service.dart';

class UpdateMaterialImageUseCase {
  UpdateMaterialImageUseCase(this._imageService, this._materialRepository);

  final MaterialImageService _imageService;
  final MaterialRepository _materialRepository;

  Future<Material> call(Material material, Uint8List bytes) async {
    final imagePath =
        await _imageService.saveMaterialImageBytes(material.id, bytes);
    final updated = material.copyWith(image: imagePath);
    await _materialRepository.save(updated);
    return updated;
  }
}
