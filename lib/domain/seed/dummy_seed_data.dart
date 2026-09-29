import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';

/// Fixed dummy inventory data for local development and demo seeding.
class DummySeedData {
  DummySeedData._();

  static const materials = [
    Material(
      id: 'seed-mat-oak',
      title: 'Oak board',
      description: '20 mm',
      quantity: 10,
    ),
    Material(
      id: 'seed-mat-screws',
      title: 'Screws M4',
      description: 'Pack of 100',
      quantity: 50,
    ),
    Material(
      id: 'seed-mat-fabric',
      title: 'Cotton fabric',
      description: '1 m width',
      quantity: 5,
    ),
    Material(
      id: 'seed-mat-glue',
      title: 'Wood glue',
      description: '250 ml',
      quantity: 2,
    ),
  ];

  static const presets = [
    Preset(
      id: 'seed-preset-shelf',
      name: 'Wall Shelf',
      description: 'Simple wall-mounted shelf',
    ),
    Preset(
      id: 'seed-preset-cushion',
      name: 'Cushion cover',
      description: 'Removable cushion cover',
    ),
  ];

  static const bomLines = [
    PresetMaterial(
      id: 'seed-bom-shelf-oak',
      materialId: 'seed-mat-oak',
      presetId: 'seed-preset-shelf',
      quantity: 2,
    ),
    PresetMaterial(
      id: 'seed-bom-shelf-screws',
      materialId: 'seed-mat-screws',
      presetId: 'seed-preset-shelf',
      quantity: 8,
    ),
    PresetMaterial(
      id: 'seed-bom-cushion-fabric',
      materialId: 'seed-mat-fabric',
      presetId: 'seed-preset-cushion',
      quantity: 2,
    ),
    PresetMaterial(
      id: 'seed-bom-cushion-glue',
      materialId: 'seed-mat-glue',
      presetId: 'seed-preset-cushion',
      quantity: 0.5,
    ),
  ];

  static const workbenchPresetId = 'seed-preset-shelf';
  static const workbenchCustomer = 'Demo Customer';
}
