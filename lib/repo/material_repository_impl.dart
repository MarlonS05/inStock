import 'package:instock/db/app_database.dart';
import 'package:instock/db/daos/material_dao.dart';
import 'package:instock/db/daos/preset_material_dao.dart';
import 'package:instock/db/daos/used_material_dao.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/models/material_in_use_exception.dart';
import 'package:instock/domain/repositories/material_repository.dart';

class MaterialRepositoryImpl implements MaterialRepository {
  MaterialRepositoryImpl(
    this._database,
    this._materialDao,
    this._presetMaterialDao,
    this._usedMaterialDao,
  );

  final AppDatabase _database;
  final MaterialDao _materialDao;
  final PresetMaterialDao _presetMaterialDao;
  final UsedMaterialDao _usedMaterialDao;

  @override
  Future<List<Material>> getAll() => _materialDao.findAll();

  @override
  Future<Material?> getById(String id) => _materialDao.findById(id);

  @override
  Future<double> getAvailableQuantity(String materialId) async {
    final material = await _materialDao.findById(materialId);
    if (material == null) {
      return 0;
    }
    final reserved =
        await _usedMaterialDao.sumReservedQuantityForMaterial(materialId);
    return material.quantity - reserved;
  }

  @override
  Future<double> getReservedQuantity(String materialId) =>
      _usedMaterialDao.sumReservedQuantityForMaterial(materialId);

  @override
  Future<Map<String, double>> getReservedQuantitiesByMaterialId() =>
      _usedMaterialDao.sumReservedQuantitiesByMaterialId();

  @override
  Future<void> save(Material material) => _materialDao.upsert(material);

  @override
  Future<void> delete(String id) async {
    await _database.transaction((txn) async {
      if (await _usedMaterialDao.existsForMaterial(id, db: txn)) {
        throw MaterialInUseException(materialId: id);
      }
      await _presetMaterialDao.deleteByMaterialId(id, db: txn);
      await _materialDao.deleteById(id, db: txn);
    });
  }
}
