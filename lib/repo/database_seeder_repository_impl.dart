import 'package:instock/db/app_database.dart';
import 'package:instock/db/daos/material_dao.dart';
import 'package:instock/db/daos/preset_material_dao.dart';
import 'package:instock/db/daos/preset_dao.dart';
import 'package:instock/domain/repositories/database_seeder_repository.dart';
import 'package:instock/domain/seed/dummy_seed_data.dart';
import 'package:instock/logger/logger.dart';

class DatabaseSeederRepositoryImpl implements DatabaseSeederRepository {
  DatabaseSeederRepositoryImpl(
    this._database,
    this._materialDao,
    this._presetDao,
    this._productMaterialDao,
  );

  final AppDatabase _database;
  final MaterialDao _materialDao;
  final PresetDao _presetDao;
  final PresetMaterialDao _productMaterialDao;

  @override
  Future<void> seedBaseData() async {
    await _database.transaction((txn) async {
      await txn.delete('products');
      await txn.delete('preset_materials');
      await txn.delete('materials');
      await txn.delete('presets');

      for (final material in DummySeedData.materials) {
        await _materialDao.upsert(material, db: txn);
      }
      for (final preset in DummySeedData.presets) {
        await _presetDao.upsert(preset, db: txn);
      }
      for (final line in DummySeedData.bomLines) {
        await _productMaterialDao.upsert(line, db: txn);
      }
    });
    logger.i('Success seeded base inventory data');
  }
}
