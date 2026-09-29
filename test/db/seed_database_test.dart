import 'package:flutter_test/flutter_test.dart';
import 'package:instock/db/app_database.dart';
import 'package:instock/db/daos/material_dao.dart';
import 'package:instock/db/daos/product_dao.dart';
import 'package:instock/db/daos/preset_material_dao.dart';
import 'package:instock/db/daos/preset_dao.dart';
import 'package:instock/db/daos/used_material_dao.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/seed/dummy_seed_data.dart';
import 'package:instock/domain/use_cases/product/add_product_to_workbench_use_case.dart';
import 'package:instock/domain/use_cases/seed/seed_database_use_case.dart';
import 'package:instock/repo/database_seeder_repository_impl.dart';
import 'package:instock/repo/material_repository_impl.dart';
import 'package:instock/repo/preset_repository_impl.dart';
import 'package:instock/repo/product_repository_impl.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late AppDatabase database;
  late MaterialDao materialDao;
  late PresetDao presetDao;
  late PresetMaterialDao productMaterialDao;
  late ProductDao productDao;
  late UsedMaterialDao usedMaterialDao;
  late MaterialRepositoryImpl materialRepository;
  late SeedDatabaseUseCase seedDatabase;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    database = AppDatabase();
    await database.open(pathOverride: inMemoryDatabasePath);

    materialDao = MaterialDao(database);
    presetDao = PresetDao(database);
    productMaterialDao = PresetMaterialDao(database);
    productDao = ProductDao(database);
    usedMaterialDao = UsedMaterialDao(database);

    materialRepository = MaterialRepositoryImpl(
      database,
      materialDao,
      productMaterialDao,
      usedMaterialDao,
    );
    final presetRepository =
        PresetRepositoryImpl(presetDao, productMaterialDao);
    final productRepository = ProductRepositoryImpl(
      database,
      productDao,
      usedMaterialDao,
      materialDao,
    );
    final seederRepository = DatabaseSeederRepositoryImpl(
      database,
      materialDao,
      presetDao,
      productMaterialDao,
    );
    final addToWorkbench = AddProductToWorkbenchUseCase(
      presetRepository,
      productRepository,
    );

    seedDatabase = SeedDatabaseUseCase(seederRepository, addToWorkbench);
  });

  tearDown(() async {
    await database.close();
  });

  test('clears and seeds dummy inventory with one workbench build', () async {
    await materialDao.upsert(DummySeedData.materials.first);

    await seedDatabase();

    expect(await materialDao.findAll(), containsAll(DummySeedData.materials));
    expect(await presetDao.findAll(), containsAll(DummySeedData.presets));
    expect(
      await productMaterialDao.findByPresetId(DummySeedData.workbenchPresetId),
      DummySeedData.bomLines
          .where((line) => line.presetId == DummySeedData.workbenchPresetId)
          .toList(),
    );

    final workbenchProducts = await productDao.findByState(ProductState.workbench);
    expect(workbenchProducts, hasLength(1));
    expect(workbenchProducts.single.customer, DummySeedData.workbenchCustomer);
    expect(workbenchProducts.single.presetName, 'Wall Shelf');

    expect(
      await materialRepository.getAvailableQuantity('seed-mat-oak'),
      8,
    );
    expect(
      await materialRepository.getAvailableQuantity('seed-mat-screws'),
      42,
    );
  });

  test('is idempotent when called twice', () async {
    await seedDatabase();
    await seedDatabase();

    expect(await materialDao.findAll(), containsAll(DummySeedData.materials));
    expect(await productDao.findByState(ProductState.workbench), hasLength(1));
  });
}
