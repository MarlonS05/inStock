import 'dart:typed_data';

/// Picks and stores images for presets on the device filesystem.
abstract interface class PresetImageService {
  /// Opens the gallery picker and returns image bytes, or `null` when cancelled.
  Future<Uint8List?> pickImageBytes();

  /// Persists [bytes] for [presetId] and returns the local file path.
  Future<String> savePresetImageBytes(String presetId, Uint8List bytes);
}
