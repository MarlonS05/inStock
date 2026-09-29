import 'package:instock/db/app_database.dart';
import 'package:instock/db/daos/material_dao.dart';
import 'package:instock/db/daos/product_dao.dart';
import 'package:instock/db/daos/preset_material_dao.dart';
import 'package:instock/db/daos/preset_dao.dart';
import 'package:instock/db/daos/used_material_dao.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/material_in_use_exception.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/use_cases/product/add_product_to_workbench_use_case.dart';
import 'package:instock/domain/use_cases/product/delete_product_use_case.dart';
import 'package:instock/domain/use_cases/product/finish_product_use_case.dart';
import 'package:instock/repo/material_repository_impl.dart';
import 'package:instock/repo/preset_repository_impl.dart';
import 'package:instock/repo/product_repository_impl.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late MaterialDao materialDao;
  late PresetDao presetDao;
  late PresetMaterialDao productMaterialDao;
  late ProductDao productDao;
  late UsedMaterialDao usedMaterialDao;
  late MaterialRepositoryImpl materialRepository;
  late PresetRepositoryImpl presetRepository;
  late ProductRepositoryImpl productRepository;
  late AddProductToWorkbenchUseCase addToWorkbench;
  late FinishProductUseCase finishProduct;
  late DeleteProductUseCase deleteProduct;

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
    presetRepository =
        PresetRepositoryImpl(presetDao, productMaterialDao);
    productRepository = ProductRepositoryImpl(
      database,
      productDao,
      usedMaterialDao,
      materialDao,
    );

    addToWorkbench = AddProductToWorkbenchUseCase(
      presetRepository,
      productRepository,
    );
    finishProduct = FinishProductUseCase(productRepository);
    deleteProduct = DeleteProductUseCase(productRepository);
  });

  tearDown(() async {
    await database.close();
  });

  test('persists materials and presets', () async {
    const material = Material(
      id: 'mat-1',
      title: 'Oak board',
      description: '20 mm',
      quantity: 10,
    );
    const preset = Preset(
      id: 'preset-1',
      name: 'Shelf',
      description: 'Wall shelf',
    );
    const bomLine = PresetMaterial(
      id: 'line-1',
      materialId: 'mat-1',
      presetId: 'preset-1',
      quantity: 2,
    );

    await materialDao.upsert(material);
    await presetDao.upsert(preset);
    await productMaterialDao.upsert(bomLine);

    expect(await materialDao.findAll(), [material]);
    expect(await presetDao.findAll(), [preset]);
    expect(await productMaterialDao.findByPresetId('preset-1'), [bomLine]);
  });

  test('workbench build reserves stock then finish subtracts inventory', () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Screws',
        description: 'M4',
        quantity: 10,
      ),
    );
    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Bracket',
        description: 'Metal bracket',
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 4,
      ),
    );

    final product = await addToWorkbench(
      presetId: 'preset-1',
      customer: 'Alex',
    );

    expect(product.state, ProductState.workbench);
    expect(product.presetName, 'Bracket');
    expect(await materialRepository.getAvailableQuantity('mat-1'), 6);

    await finishProduct(product.id);

    final material = await materialDao.findById('mat-1');
    expect(material!.quantity, 6);

    final finished = await productDao.findById(product.id);
    expect(finished!.state, ProductState.finished);
    expect(finished.updatedAt.millisecondsSinceEpoch, greaterThan(0));

    expect(await usedMaterialDao.findByProductId(product.id), isEmpty);
  });

  test('removing workbench product releases reservations without consuming stock',
      () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Screws',
        description: 'M4',
        quantity: 10,
      ),
    );
    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Bracket',
        description: 'Metal bracket',
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 4,
      ),
    );

    final product = await addToWorkbench(
      presetId: 'preset-1',
      customer: 'Alex',
    );

    expect(await materialRepository.getAvailableQuantity('mat-1'), 6);

    await deleteProduct(product.id);

    expect(await productDao.findById(product.id), isNull);
    expect(await usedMaterialDao.findByProductId(product.id), isEmpty);

    final material = await materialDao.findById('mat-1');
    expect(material!.quantity, 10);
    expect(await materialRepository.getAvailableQuantity('mat-1'), 10);
  });

  test('archive lists finished products within updated_at range', () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Paint',
        description: 'White',
        quantity: 10,
      ),
    );
    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Sign',
        description: 'Shop sign',
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 1,
      ),
    );

    final inRangeProduct = await addToWorkbench(
      presetId: 'preset-1',
      customer: 'In range',
    );
    await finishProduct(inRangeProduct.id);

    final finished = await productDao.findById(inRangeProduct.id);
    final finishedAt = finished!.updatedAt;

    final results = await productDao.findFinishedUpdatedBetween(
      startInclusive: finishedAt.subtract(const Duration(days: 1)),
      endInclusive: finishedAt.add(const Duration(days: 1)),
    );

    expect(results, hasLength(1));
    expect(results.single.id, inRangeProduct.id);

    final emptyResults = await productDao.findFinishedUpdatedBetween(
      startInclusive: finishedAt.subtract(const Duration(days: 30)),
      endInclusive: finishedAt.subtract(const Duration(days: 20)),
    );
    expect(emptyResults, isEmpty);
  });

  test('add to workbench allows insufficient stock and reserves materials',
      () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Fabric',
        description: 'Cotton',
        quantity: 1,
      ),
    );
    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Bag',
        description: 'Tote bag',
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 3,
      ),
    );

    final product = await addToWorkbench(
      presetId: 'preset-1',
      customer: 'Sam',
    );

    expect(product.state, ProductState.workbench);
    expect(await materialRepository.getReservedQuantity('mat-1'), 3);
    expect(await materialRepository.getAvailableQuantity('mat-1'), -2);
  });

  test('product snapshots preset fields at creation time', () async {
    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Original name',
        description: 'Original description',
      ),
    );

    final product = Product.fromPreset(
      id: 'prod-1',
      state: ProductState.workbench,
      source: const Preset(
        id: 'preset-1',
        name: 'Original name',
        description: 'Original description',
      ),
      customer: 'Jamie',
      updatedAt: DateTime.fromMillisecondsSinceEpoch(1),
    );
    await productDao.upsert(product);

    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Renamed',
        description: 'Updated',
      ),
    );

    final stored = await productDao.findById('prod-1');
    expect(stored!.presetName, 'Original name');
    expect(stored.presetDescription, 'Original description');
  });

  test('used material snapshots BOM line', () async {
    const bomLine = PresetMaterial(
      id: 'line-1',
      materialId: 'mat-1',
      presetId: 'preset-1',
      quantity: 2.5,
    );
    final used = UsedMaterial.fromPresetMaterial(
      id: 'used-1',
      productId: 'prod-1',
      source: bomLine,
    );

    expect(used.materialId, 'mat-1');
    expect(used.quantity, 2.5);
  });

  test('deleting material removes preset BOM lines', () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Oak board',
        description: '20 mm',
        quantity: 10,
      ),
    );
    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Shelf',
        description: 'Wall shelf',
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 2,
      ),
    );

    await materialRepository.delete('mat-1');

    expect(await materialDao.findById('mat-1'), isNull);
    expect(await productMaterialDao.findByPresetId('preset-1'), isEmpty);
  });

  test('deleting material reserved on workbench throws', () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Oak board',
        description: '20 mm',
        quantity: 10,
      ),
    );
    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Shelf',
        description: 'Wall shelf',
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 2,
      ),
    );
    await addToWorkbench(presetId: 'preset-1', customer: 'Alex');

    expect(
      () => materialRepository.delete('mat-1'),
      throwsA(isA<MaterialInUseException>()),
    );
    expect(await materialDao.findById('mat-1'), isNotNull);
  });

  test('deleting preset keeps products that referenced it', () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Oak board',
        description: '20 mm',
        quantity: 10,
      ),
    );
    await presetDao.upsert(
      const Preset(
        id: 'preset-1',
        name: 'Shelf',
        description: 'Wall shelf',
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 2,
      ),
    );

    final product = await addToWorkbench(
      presetId: 'preset-1',
      customer: 'Alex',
    );

    await presetRepository.delete('preset-1');

    expect(await presetDao.findById('preset-1'), isNull);
    expect(await productMaterialDao.findByPresetId('preset-1'), isEmpty);

    final stored = await productDao.findById(product.id);
    expect(stored, isNotNull);
    expect(stored!.presetId, 'preset-1');
    expect(stored.presetName, 'Shelf');
    expect(stored.presetDescription, 'Wall shelf');
  });

  test('sumReservedQuantitiesByMaterialId groups active workbench only',
      () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Oak',
        description: '',
        quantity: 10,
      ),
    );
    await materialDao.upsert(
      const Material(
        id: 'mat-2',
        title: 'Pine',
        description: '',
        quantity: 5,
      ),
    );
    await presetDao.upsert(
      const Preset(id: 'preset-1', name: 'A', description: ''),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 2,
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-2',
        materialId: 'mat-2',
        presetId: 'preset-1',
        quantity: 1,
      ),
    );

    final first = await addToWorkbench(
      presetId: 'preset-1',
      customer: 'Alex',
    );
    await addToWorkbench(presetId: 'preset-1', customer: 'Sam');
    await finishProduct(first.id);

    // Finished build clears its used_materials; only the remaining workbench
    // build contributes to reserved totals.
    final bulk = await usedMaterialDao.sumReservedQuantitiesByMaterialId();
    expect(bulk['mat-1'], 2);
    expect(bulk['mat-2'], 1);
    expect(
      await usedMaterialDao.sumReservedQuantityForMaterial('mat-1'),
      bulk['mat-1'],
    );
    expect(
      await usedMaterialDao.sumReservedQuantityForMaterial('mat-2'),
      bulk['mat-2'],
    );

    // Orphaned used_materials on a finished product must not count.
    await productDao.upsert(
      Product(
        id: 'finished-orphan',
        state: ProductState.finished,
        presetId: 'preset-1',
        presetName: 'A',
        presetDescription: '',
        customer: 'Pat',
        updatedAt: DateTime(2026, 7, 21),
      ),
    );
    await usedMaterialDao.upsert(
      const UsedMaterial(
        id: 'orphan-1',
        productId: 'finished-orphan',
        materialId: 'mat-1',
        quantity: 99,
      ),
    );
    final afterOrphan =
        await usedMaterialDao.sumReservedQuantitiesByMaterialId();
    expect(afterOrphan['mat-1'], 2);
  });

  test('countByPresetId returns BOM line counts', () async {
    await materialDao.upsert(
      const Material(
        id: 'mat-1',
        title: 'Oak',
        description: '',
        quantity: 10,
      ),
    );
    await materialDao.upsert(
      const Material(
        id: 'mat-2',
        title: 'Pine',
        description: '',
        quantity: 5,
      ),
    );
    await presetDao.upsert(
      const Preset(id: 'preset-1', name: 'Shelf', description: ''),
    );
    await presetDao.upsert(
      const Preset(id: 'preset-2', name: 'Table', description: ''),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-1',
        materialId: 'mat-1',
        presetId: 'preset-1',
        quantity: 2,
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-2',
        materialId: 'mat-2',
        presetId: 'preset-1',
        quantity: 1,
      ),
    );
    await productMaterialDao.upsert(
      const PresetMaterial(
        id: 'line-3',
        materialId: 'mat-1',
        presetId: 'preset-2',
        quantity: 4,
      ),
    );

    final counts = await productMaterialDao.countByPresetId();
    expect(counts['preset-1'], 2);
    expect(counts['preset-2'], 1);
    expect(
      counts['preset-1'],
      (await productMaterialDao.findByPresetId('preset-1')).length,
    );
    expect(
      counts['preset-2'],
      (await productMaterialDao.findByPresetId('preset-2')).length,
    );
  });
}
