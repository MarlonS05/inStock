import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/validators/is_untouched_preset_draft.dart';

void main() {
  const defaultName = 'New product';
  const untouched = Preset(
    id: 'preset-1',
    name: defaultName,
    description: '',
  );

  group('isUntouchedPresetDraft', () {
    test('returns true for create-time defaults and empty BOM', () {
      expect(
        isUntouchedPresetDraft(
          preset: untouched,
          bomLines: const [],
          defaultName: defaultName,
        ),
        isTrue,
      );
    });

    test('returns false when name differs from default', () {
      expect(
        isUntouchedPresetDraft(
          preset: untouched.copyWith(name: 'Custom'),
          bomLines: const [],
          defaultName: defaultName,
        ),
        isFalse,
      );
    });

    test('returns false when description is non-empty', () {
      expect(
        isUntouchedPresetDraft(
          preset: untouched.copyWith(description: 'Notes'),
          bomLines: const [],
          defaultName: defaultName,
        ),
        isFalse,
      );
    });

    test('returns false when image is set', () {
      expect(
        isUntouchedPresetDraft(
          preset: untouched.copyWith(image: '/path/to/image.jpg'),
          bomLines: const [],
          defaultName: defaultName,
        ),
        isFalse,
      );
    });

    test('returns false when BOM has lines', () {
      expect(
        isUntouchedPresetDraft(
          preset: untouched,
          bomLines: const [
            PresetMaterial(
              id: 'line-1',
              materialId: 'mat-1',
              presetId: 'preset-1',
              quantity: 1,
            ),
          ],
          defaultName: defaultName,
        ),
        isFalse,
      );
    });
  });
}
