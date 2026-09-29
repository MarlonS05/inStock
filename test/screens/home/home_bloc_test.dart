import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/material.dart';
import 'package:instock/domain/models/database_bootstrap_status.dart';
import 'package:instock/domain/repositories/database_maintenance_repository.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/use_cases/database/retry_database_use_case.dart';
import 'package:instock/domain/use_cases/database/wipe_database_use_case.dart';
import 'package:instock/domain/use_cases/material/add_material_stock_use_case.dart';
import 'package:instock/domain/use_cases/quote/pick_daily_quote_use_case.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/home/home/home_bloc.dart';
import 'package:instock/screens/home/home/home_event.dart';
import 'package:instock/screens/home/home/home_state.dart';

void main() {
  group('HomeBloc', () {
    late _FakeMaterialRepository materialRepository;
    late _FakeDatabaseMaintenanceRepository maintenanceRepository;
    late HomeBloc bloc;

    setUp(() {
      materialRepository = _FakeMaterialRepository();
      maintenanceRepository = _FakeDatabaseMaintenanceRepository();
      bloc = HomeBloc(
        PickDailyQuoteUseCase(),
        materialRepository,
        AddMaterialStockUseCase(materialRepository),
        const DatabaseBootstrapStatus.ready(),
        RetryDatabaseUseCase(maintenanceRepository),
        WipeDatabaseUseCase(maintenanceRepository),
      );
    });

    tearDown(() async {
      await bloc.close();
    });

    test(
      'started sets quote and builds shopping list for zero available',
      () async {
        materialRepository.materials.addAll([
          const Material(
            id: 'mat-oak',
            title: 'Oak',
            description: '',
            quantity: 0,
          ),
          const Material(
            id: 'mat-pine',
            title: 'Pine',
            description: '',
            quantity: 4,
          ),
        ]);
        materialRepository.reservedById['mat-oak'] = 2;

        final ready = bloc.stream.firstWhere(
          (s) =>
              s.status == HomeStatus.ready &&
              s.quoteIndex != null &&
              s.shoppingList.length == 1,
        );
        bloc.add(const HomeEvent.started());
        final state = await ready;

        expect(state.shoppingList.single.material.id, 'mat-oak');
        expect(state.shoppingList.single.requiredQuantity, 2);
        expect(materialRepository.bulkReservedCalls, 1);
        expect(materialRepository.availableCalls, 0);
        expect(materialRepository.reservedCalls, 0);
      },
    );

    test('started emits databaseOpenFailure when bootstrap failed', () async {
      await bloc.close();
      bloc = HomeBloc(
        PickDailyQuoteUseCase(),
        materialRepository,
        AddMaterialStockUseCase(materialRepository),
        DatabaseBootstrapStatus.failed(Exception('open failed')),
        RetryDatabaseUseCase(maintenanceRepository),
        WipeDatabaseUseCase(maintenanceRepository),
      );

      final failed = bloc.stream.firstWhere(
        (s) =>
            s.status == HomeStatus.failure &&
            s.errorMessage == UiErrorCodes.databaseOpenFailure &&
            s.quoteIndex != null,
      );
      bloc.add(const HomeEvent.started());
      final state = await failed;

      expect(state.shoppingList, isEmpty);
      expect(materialRepository.bulkReservedCalls, 0);
    });

    test('databaseRetryRequested recovers and loads shopping list', () async {
      await bloc.close();
      bloc = HomeBloc(
        PickDailyQuoteUseCase(),
        materialRepository,
        AddMaterialStockUseCase(materialRepository),
        DatabaseBootstrapStatus.failed(Exception('open failed')),
        RetryDatabaseUseCase(maintenanceRepository),
        WipeDatabaseUseCase(maintenanceRepository),
      );

      final failed = bloc.stream.firstWhere(
        (s) => s.errorMessage == UiErrorCodes.databaseOpenFailure,
      );
      bloc.add(const HomeEvent.started());
      await failed;

      materialRepository.materials.add(
        const Material(
          id: 'mat-oak',
          title: 'Oak',
          description: '',
          quantity: 0,
        ),
      );
      materialRepository.reservedById['mat-oak'] = 1;

      final ready = bloc.stream.firstWhere(
        (s) =>
            s.status == HomeStatus.ready &&
            s.errorMessage == null &&
            s.shoppingList.length == 1,
      );
      bloc.add(const HomeEvent.databaseRetryRequested());
      final state = await ready;

      expect(maintenanceRepository.retryCalls, 1);
      expect(maintenanceRepository.wipeCalls, 0);
      expect(state.shoppingList.single.material.id, 'mat-oak');
    });

    test(
      'databaseRetryRequested re-emits databaseOpenFailure when retry fails',
      () async {
        await bloc.close();
        maintenanceRepository.failRetry = true;
        bloc = HomeBloc(
          PickDailyQuoteUseCase(),
          materialRepository,
          AddMaterialStockUseCase(materialRepository),
          DatabaseBootstrapStatus.failed(Exception('open failed')),
          RetryDatabaseUseCase(maintenanceRepository),
          WipeDatabaseUseCase(maintenanceRepository),
        );

        final failed = bloc.stream.firstWhere(
          (s) => s.errorMessage == UiErrorCodes.databaseOpenFailure,
        );
        bloc.add(const HomeEvent.started());
        await failed;

        final cleared = bloc.stream.firstWhere((s) => s.errorMessage == null);
        final failedAgain = bloc.stream.firstWhere(
          (s) =>
              s.status == HomeStatus.failure &&
              s.errorMessage == UiErrorCodes.databaseOpenFailure,
        );
        bloc.add(const HomeEvent.databaseRetryRequested());
        await cleared;
        final state = await failedAgain;

        expect(maintenanceRepository.retryCalls, 1);
        expect(state.shoppingList, isEmpty);
      },
    );

    test('databaseWipeRequested recovers and loads shopping list', () async {
      await bloc.close();
      bloc = HomeBloc(
        PickDailyQuoteUseCase(),
        materialRepository,
        AddMaterialStockUseCase(materialRepository),
        DatabaseBootstrapStatus.failed(Exception('open failed')),
        RetryDatabaseUseCase(maintenanceRepository),
        WipeDatabaseUseCase(maintenanceRepository),
      );

      final failed = bloc.stream.firstWhere(
        (s) => s.errorMessage == UiErrorCodes.databaseOpenFailure,
      );
      bloc.add(const HomeEvent.started());
      await failed;

      materialRepository.materials.add(
        const Material(
          id: 'mat-oak',
          title: 'Oak',
          description: '',
          quantity: 0,
        ),
      );
      materialRepository.reservedById['mat-oak'] = 1;

      final ready = bloc.stream.firstWhere(
        (s) =>
            s.status == HomeStatus.ready &&
            s.errorMessage == null &&
            s.shoppingList.length == 1,
      );
      bloc.add(const HomeEvent.databaseWipeRequested());
      final state = await ready;

      expect(maintenanceRepository.wipeCalls, 1);
      expect(state.shoppingList.single.material.id, 'mat-oak');
    });

    test(
      'databaseWipeRequested re-emits databaseOpenFailure when wipe fails',
      () async {
        await bloc.close();
        maintenanceRepository.failWipe = true;
        bloc = HomeBloc(
          PickDailyQuoteUseCase(),
          materialRepository,
          AddMaterialStockUseCase(materialRepository),
          DatabaseBootstrapStatus.failed(Exception('open failed')),
          RetryDatabaseUseCase(maintenanceRepository),
          WipeDatabaseUseCase(maintenanceRepository),
        );

        final failed = bloc.stream.firstWhere(
          (s) => s.errorMessage == UiErrorCodes.databaseOpenFailure,
        );
        bloc.add(const HomeEvent.started());
        await failed;

        final cleared = bloc.stream.firstWhere((s) => s.errorMessage == null);
        final failedAgain = bloc.stream.firstWhere(
          (s) =>
              s.status == HomeStatus.failure &&
              s.errorMessage == UiErrorCodes.databaseOpenFailure,
        );
        bloc.add(const HomeEvent.databaseWipeRequested());
        await cleared;
        final state = await failedAgain;

        expect(maintenanceRepository.wipeCalls, 1);
        expect(state.shoppingList, isEmpty);
      },
    );

    test('materialPurchased adds stock and refreshes shopping list', () async {
      materialRepository.materials.add(
        const Material(
          id: 'mat-oak',
          title: 'Oak',
          description: '',
          quantity: 0,
        ),
      );
      materialRepository.reservedById['mat-oak'] = 1;

      final started = bloc.stream.firstWhere(
        (state) =>
            state.status == HomeStatus.ready && state.shoppingList.isNotEmpty,
      );
      bloc.add(const HomeEvent.started());
      await started;

      final refreshed = bloc.stream.firstWhere(
        (s) => s.status == HomeStatus.ready && s.shoppingList.isEmpty,
      );
      bloc.add(
        const HomeEvent.materialPurchased(materialId: 'mat-oak', quantity: 3),
      );
      final state = await refreshed;

      expect(state.shoppingList, isEmpty);
      expect(materialRepository.materials.single.quantity, 3);
      expect(materialRepository.bulkReservedCalls, 2);
      expect(materialRepository.availableCalls, 0);
      expect(materialRepository.reservedCalls, 0);
    });
  });
}

class _FakeMaterialRepository implements MaterialRepository {
  final materials = <Material>[];
  final reservedById = <String, double>{};
  var bulkReservedCalls = 0;
  var availableCalls = 0;
  var reservedCalls = 0;

  @override
  Future<List<Material>> getAll() async => List.of(materials);

  @override
  Future<Material?> getById(String id) async {
    for (final material in materials) {
      if (material.id == id) {
        return material;
      }
    }
    return null;
  }

  @override
  Future<double> getAvailableQuantity(String materialId) async {
    availableCalls++;
    final material = await getById(materialId);
    final reserved = reservedById[materialId] ?? 0;
    return (material?.quantity ?? 0) - reserved;
  }

  @override
  Future<double> getReservedQuantity(String materialId) async {
    reservedCalls++;
    return reservedById[materialId] ?? 0;
  }

  @override
  Future<Map<String, double>> getReservedQuantitiesByMaterialId() async {
    bulkReservedCalls++;
    return Map.of(reservedById);
  }

  @override
  Future<void> save(Material material) async {
    materials
      ..removeWhere((item) => item.id == material.id)
      ..add(material);
  }

  @override
  Future<void> delete(String id) async {
    materials.removeWhere((item) => item.id == id);
  }
}

class _FakeDatabaseMaintenanceRepository
    implements DatabaseMaintenanceRepository {
  var retryCalls = 0;
  var wipeCalls = 0;
  var failRetry = false;
  var failWipe = false;

  @override
  Future<void> retryOpen() async {
    retryCalls++;
    if (failRetry) {
      throw Exception('retry failed');
    }
  }

  @override
  Future<void> wipeAndRecreate() async {
    wipeCalls++;
    if (failWipe) {
      throw Exception('wipe failed');
    }
  }
}
