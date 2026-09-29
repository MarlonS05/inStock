import 'dart:io';

import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instock/domain/services/material_image_service.dart';
import 'package:instock/logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class MaterialImageServiceImpl implements MaterialImageService {
  MaterialImageServiceImpl({ImagePicker? picker})
      : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  @override
  Future<Uint8List?> pickImageBytes() async {
    try {
      final picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (picked == null) {
        return null;
      }

      return picked.readAsBytes();
    } on PlatformException catch (error, stackTrace) {
      logger.w('Failed picked material image: $error\n$stackTrace');
      rethrow;
    }
  }

  @override
  Future<String> saveMaterialImageBytes(
    String materialId,
    Uint8List bytes,
  ) async {
    final appDir = await getApplicationDocumentsDirectory();
    final materialDir = Directory(p.join(appDir.path, 'material_images'));
    if (!await materialDir.exists()) {
      await materialDir.create(recursive: true);
    }

    final destPath = p.join(materialDir.path, '$materialId.jpg');
    await File(destPath).writeAsBytes(bytes, flush: true);
    await FileImage(File(destPath)).evict();
    return destPath;
  }
}
