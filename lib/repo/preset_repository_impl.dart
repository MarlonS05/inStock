import 'package:instock/db/daos/preset_material_dao.dart';
import 'package:instock/db/daos/preset_dao.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/repositories/preset_repository.dart';

class PresetRepositoryImpl implements PresetRepository {
  PresetRepositoryImpl(this._presetDao, this._productMaterialDao);

  final PresetDao _presetDao;
  final PresetMaterialDao _productMaterialDao;

  @override
  Future<List<Preset>> getAll() => _presetDao.findAll();

  @override
  Future<Preset?> getById(String id) => _presetDao.findById(id);

  @override
  Future<List<PresetMaterial>> getMaterials(String presetId) =>
      _productMaterialDao.findByPresetId(presetId);

  @override
  Future<Map<String, int>> getMaterialCountsByPresetId() =>
      _productMaterialDao.countByPresetId();

  @override
  Future<void> save(Preset preset) => _presetDao.upsert(preset);

  @override
  Future<void> delete(String id) => _presetDao.deleteById(id);

  @override
  Future<void> saveMaterial(PresetMaterial line) =>
      _productMaterialDao.upsert(line);

  @override
  Future<void> deleteMaterial(String id) =>
      _productMaterialDao.deleteById(id);
}
