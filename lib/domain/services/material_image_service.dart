import 'dart:typed_data';

/// Picks and stores images for materials on the device filesystem.
abstract interface class MaterialImageService {
  /// Opens the gallery picker and returns image bytes, or `null` when cancelled.
  Future<Uint8List?> pickImageBytes();

  /// Persists [bytes] for [materialId] and returns the local file path.
  Future<String> saveMaterialImageBytes(String materialId, Uint8List bytes);
}
