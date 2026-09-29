import 'package:flutter_test/flutter_test.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/preset_material.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/screens/archive/archive/archive_bloc.dart';
import 'package:instock/screens/archive/archive/archive_event.dart';
import 'package:instock/screens/archive/archive/archive_state.dart';

void main() {
  group('ArchiveBloc', () {
    late _FakeProductRepository productRepository;
    late ArchiveBloc bloc;
    late Product product;

    setUp(() {
      final today = DateTime.now();
      final day = DateTime(today.year, today.month, today.day);
      product = Product(
        id: 'prod-1',
        state: ProductState.finished,
        presetId: 'preset-1',
        presetName: 'Board',
        presetDescription: '',
        customer: 'Ada',
        updatedAt: day.subtract(const Duration(days: 5)),
      );
      productRepository = _FakeProductRepository(products: [product]);
      bloc = ArchiveBloc(productRepository);
    });

    tearDown(() async {
      await bloc.close();
    });

    test('started loads finished products in the default range', () async {
      final loaded = bloc.stream.firstWhere(
        (s) => s.status == ArchiveStatus.loaded,
      );
      bloc.add(const ArchiveEvent.started());
      final state = await loaded;

      expect(state.products.single.id, 'prod-1');
      expect(productRepository.lastStart, isNotNull);
      expect(productRepository.lastEnd, isNotNull);
    });

    test('startDateChanged clamps end date and reloads', () async {
      final started = bloc.stream.firstWhere(
        (state) => state.status == ArchiveStatus.loaded,
      );
      bloc.add(const ArchiveEvent.started());
      await started;

      final newStart = bloc.state.endDate.add(const Duration(days: 14));
      final expectedDay =
          DateTime(newStart.year, newStart.month, newStart.day);

      final reloaded = bloc.stream.firstWhere(
        (s) =>
            s.status == ArchiveStatus.loaded &&
            s.startDate == expectedDay &&
            s.endDate == expectedDay,
      );
      bloc.add(ArchiveEvent.startDateChanged(newStart));
      final state = await reloaded;

      expect(state.startDate, expectedDay);
      expect(state.endDate, expectedDay);
    });
  });
}

class _FakeProductRepository implements ProductRepository {
  _FakeProductRepository({required this.products});

  final List<Product> products;
  DateTime? lastStart;
  DateTime? lastEnd;

  @override
  Future<List<Product>> getFinishedBetween({
    required DateTime startInclusive,
    required DateTime endInclusive,
  }) async {
    lastStart = startInclusive;
    lastEnd = endInclusive;
    return products
        .where(
          (product) =>
              !product.updatedAt.isBefore(startInclusive) &&
              !product.updatedAt.isAfter(endInclusive),
        )
        .toList();
  }

  @override
  Future<Product> addToWorkbench({
    required Preset preset,
    required List<PresetMaterial> bom,
    required String customer,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) async {}

  @override
  Future<void> deleteUsedMaterial(String id) async {}

  @override
  Future<void> finish(String productId) async {}

  @override
  Future<List<Product>> getAll() async => products;

  @override
  Future<Product?> getById(String id) async => null;

  @override
  Future<List<Product>> getByState(ProductState state) async => [];

  @override
  Future<List<UsedMaterial>> getUsedMaterials(String productId) async => [];

  @override
  Future<Map<String, List<UsedMaterial>>> getUsedMaterialsByProductId(
    List<String> productIds,
  ) async =>
      {for (final id in productIds) id: <UsedMaterial>[]};

  @override
  Future<void> save(Product product) async {}

  @override
  Future<void> saveUsedMaterial(UsedMaterial usedMaterial) async {}
}
