import 'package:get_it/get_it.dart';
import 'package:instock/db/app_database.dart';
import 'package:instock/db/daos/material_dao.dart';
import 'package:instock/db/daos/product_dao.dart';
import 'package:instock/db/daos/preset_material_dao.dart';
import 'package:instock/db/daos/preset_dao.dart';
import 'package:instock/db/daos/used_material_dao.dart';
import 'package:instock/domain/models/database_bootstrap_status.dart';
import 'package:instock/domain/repositories/database_maintenance_repository.dart';
import 'package:instock/domain/repositories/database_seeder_repository.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/repositories/preset_repository.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/domain/repositories/locale_preferences_repository.dart';
import 'package:instock/domain/repositories/theme_preferences_repository.dart';
import 'package:instock/domain/use_cases/database/retry_database_use_case.dart';
import 'package:instock/domain/use_cases/database/wipe_database_use_case.dart';
import 'package:instock/domain/use_cases/material/add_material_stock_use_case.dart';
import 'package:instock/domain/use_cases/product/add_product_to_workbench_use_case.dart';
import 'package:instock/domain/use_cases/material/create_or_update_material_use_case.dart';
import 'package:instock/domain/use_cases/preset/create_or_update_preset_use_case.dart';
import 'package:instock/domain/use_cases/material/delete_material_use_case.dart';
import 'package:instock/domain/use_cases/preset/delete_preset_material_use_case.dart';
import 'package:instock/domain/use_cases/preset/delete_preset_use_case.dart';
import 'package:instock/domain/use_cases/product/delete_product_use_case.dart';
import 'package:instock/domain/use_cases/product/delete_used_material_use_case.dart';
import 'package:instock/domain/use_cases/product/finish_product_use_case.dart';
import 'package:instock/domain/use_cases/preset/save_preset_material_use_case.dart';
import 'package:instock/domain/use_cases/product/save_used_material_use_case.dart';
import 'package:instock/domain/use_cases/seed/seed_database_use_case.dart';
import 'package:instock/domain/use_cases/material/update_material_image_use_case.dart';
import 'package:instock/domain/use_cases/preset/update_preset_image_use_case.dart';
import 'package:instock/domain/use_cases/product/update_product_use_case.dart';
import 'package:instock/domain/services/material_image_service.dart';
import 'package:instock/domain/services/preset_image_service.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/platform/locale_preferences_repository_impl.dart';
import 'package:instock/platform/material_image_service_impl.dart';
import 'package:instock/platform/preset_image_service_impl.dart';
import 'package:instock/platform/theme_preferences_repository_impl.dart';
import 'package:instock/repo/database_maintenance_repository_impl.dart';
import 'package:instock/repo/database_seeder_repository_impl.dart';
import 'package:instock/repo/material_repository_impl.dart';
import 'package:instock/repo/preset_repository_impl.dart';
import 'package:instock/repo/product_repository_impl.dart';
import 'package:instock/domain/use_cases/quote/pick_daily_quote_use_case.dart';
import 'package:instock/screens/home/home/home_bloc.dart';
import 'package:instock/screens/inventory/inventory/inventory_bloc.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_bloc.dart';
import 'package:instock/screens/products/products/products_bloc.dart';
import 'package:instock/screens/settings/settings/settings_bloc.dart';
import 'package:instock/screens/archive/archive/archive_bloc.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_bloc.dart';
import 'package:instock/screens/workshop/workshop/workshop_bloc.dart';
import 'package:instock/screens/shell/app_shell/app_shell_bloc.dart';
import 'package:instock/theme/app_locale_cubit.dart';
import 'package:instock/theme/app_theme_cubit.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies({String? databasePathOverride}) async {
  await _registerSingletons(databasePathOverride: databasePathOverride);
  _registerUseCases();
  _registerScreens();
}

Future<void> _registerSingletons({String? databasePathOverride}) async {
  // database
  getIt.registerLazySingleton<AppDatabase>(
    () => AppDatabase(),
    dispose: (db) => db.close(),
  );

  final database = getIt<AppDatabase>();
  try {
    await database.open(pathOverride: databasePathOverride);
    getIt.registerSingleton(const DatabaseBootstrapStatus.ready());
  } catch (error, stackTrace) {
    logger.w('Failed opened database: $error\n$stackTrace');
    getIt.registerSingleton(DatabaseBootstrapStatus.failed(error));
  }

  // daos
  getIt.registerLazySingleton<MaterialDao>(() => MaterialDao(getIt()));
  getIt.registerLazySingleton<PresetDao>(() => PresetDao(getIt()));
  getIt.registerLazySingleton<PresetMaterialDao>(
    () => PresetMaterialDao(getIt()),
  );
  getIt.registerLazySingleton<ProductDao>(() => ProductDao(getIt()));
  getIt.registerLazySingleton<UsedMaterialDao>(() => UsedMaterialDao(getIt()));

  // inventory repos
  getIt.registerLazySingleton<MaterialRepository>(
    () => MaterialRepositoryImpl(getIt(), getIt(), getIt(), getIt()),
  );

  // products repos
  getIt.registerLazySingleton<PresetRepository>(
    () => PresetRepositoryImpl(getIt(), getIt()),
  );

  // workshop repos
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt(), getIt(), getIt(), getIt()),
  );

  // seeding
  getIt.registerLazySingleton<DatabaseSeederRepository>(
    () => DatabaseSeederRepositoryImpl(getIt(), getIt(), getIt(), getIt()),
  );

  // database maintenance
  getIt.registerLazySingleton<DatabaseMaintenanceRepository>(
    () => DatabaseMaintenanceRepositoryImpl(getIt()),
  );

  // platform adapters
  getIt.registerLazySingleton<MaterialImageService>(
    () => MaterialImageServiceImpl(),
  );
  getIt.registerLazySingleton<PresetImageService>(
    () => PresetImageServiceImpl(),
  );
  getIt.registerLazySingleton<ThemePreferencesRepository>(
    () => ThemePreferencesRepositoryImpl(),
  );
  getIt.registerLazySingleton<LocalePreferencesRepository>(
    () => LocalePreferencesRepositoryImpl(),
  );

  // app preferences
  getIt.registerLazySingleton<AppThemeCubit>(
    () => AppThemeCubit(getIt())..load(),
  );
  getIt.registerLazySingleton<AppLocaleCubit>(
    () => AppLocaleCubit(getIt())..load(),
  );
}

void _registerUseCases() {
  // inventory use cases
  getIt.registerLazySingleton<CreateOrUpdateMaterialUseCase>(
    () => CreateOrUpdateMaterialUseCase(getIt()),
  );
  getIt.registerLazySingleton<AddMaterialStockUseCase>(
    () => AddMaterialStockUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeleteMaterialUseCase>(
    () => DeleteMaterialUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdateMaterialImageUseCase>(
    () => UpdateMaterialImageUseCase(getIt(), getIt()),
  );

  // products use cases
  getIt.registerLazySingleton<CreateOrUpdatePresetUseCase>(
    () => CreateOrUpdatePresetUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeletePresetUseCase>(
    () => DeletePresetUseCase(getIt()),
  );
  getIt.registerLazySingleton<SavePresetMaterialUseCase>(
    () => SavePresetMaterialUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeletePresetMaterialUseCase>(
    () => DeletePresetMaterialUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdatePresetImageUseCase>(
    () => UpdatePresetImageUseCase(getIt(), getIt()),
  );

  // workshop use cases
  getIt.registerLazySingleton<AddProductToWorkbenchUseCase>(
    () => AddProductToWorkbenchUseCase(getIt(), getIt()),
  );
  getIt.registerLazySingleton<FinishProductUseCase>(
    () => FinishProductUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeleteProductUseCase>(
    () => DeleteProductUseCase(getIt()),
  );
  getIt.registerLazySingleton<UpdateProductUseCase>(
    () => UpdateProductUseCase(getIt()),
  );
  getIt.registerLazySingleton<SaveUsedMaterialUseCase>(
    () => SaveUsedMaterialUseCase(getIt()),
  );
  getIt.registerLazySingleton<DeleteUsedMaterialUseCase>(
    () => DeleteUsedMaterialUseCase(getIt()),
  );

  // seeding use cases
  getIt.registerLazySingleton<SeedDatabaseUseCase>(
    () => SeedDatabaseUseCase(getIt(), getIt()),
  );

  // database use cases
  getIt.registerLazySingleton<RetryDatabaseUseCase>(
    () => RetryDatabaseUseCase(getIt()),
  );
  getIt.registerLazySingleton<WipeDatabaseUseCase>(
    () => WipeDatabaseUseCase(getIt()),
  );

  // home use cases
  getIt.registerLazySingleton<PickDailyQuoteUseCase>(
    () => PickDailyQuoteUseCase(),
  );
}

void _registerScreens() {
  // home screens
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt()),
  );

  // inventory screens
  getIt.registerFactory<InventoryBloc>(
    () => InventoryBloc(getIt(), getIt(), getIt(), getIt(), getIt()),
  );

  // products screens
  getIt.registerFactory<ProductsBloc>(
    () => ProductsBloc(getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<PresetDetailBloc>(
    () => PresetDetailBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  // workshop screens
  getIt.registerFactory<WorkshopBloc>(() => WorkshopBloc(getIt(), getIt()));
  getIt.registerFactory<ProductDetailBloc>(
    () => ProductDetailBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  // archive screens
  getIt.registerFactory<ArchiveBloc>(() => ArchiveBloc(getIt()));

  // settings screens
  getIt.registerFactory<SettingsBloc>(() => SettingsBloc(getIt(), getIt()));

  // shell
  getIt.registerLazySingleton<AppShellBloc>(() => AppShellBloc());
}
