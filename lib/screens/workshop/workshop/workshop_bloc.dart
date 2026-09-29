import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/entities/material.dart' as domain;
import 'package:instock/domain/entities/product.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/router/app_router.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/workshop/workshop/workshop_event.dart';
import 'package:instock/screens/workshop/workshop/workshop_state.dart';

class WorkshopBloc extends Bloc<WorkshopEvent, WorkshopState> {
  WorkshopBloc(this._productRepository, this._materialRepository)
      : super(const WorkshopState()) {
    on<WorkshopStarted>(_onStarted);
    on<WorkshopRefreshRequested>(_onRefreshRequested);
    on<WorkshopOpenArchiveTapped>(_onOpenArchiveTapped);
    on<WorkshopOpenProductDetailTapped>(_onOpenProductDetailTapped);
  }

  final ProductRepository _productRepository;
  final MaterialRepository _materialRepository;

  Future<void> _onStarted(
    WorkshopStarted event,
    Emitter<WorkshopState> emit,
  ) async {
    await _loadProducts(emit);
  }

  Future<void> _onRefreshRequested(
    WorkshopRefreshRequested event,
    Emitter<WorkshopState> emit,
  ) async {
    await _loadProducts(emit);
  }

  Future<void> _onOpenArchiveTapped(
    WorkshopOpenArchiveTapped event,
    Emitter<WorkshopState> emit,
  ) async {
    await pushArchive();
  }

  Future<void> _onOpenProductDetailTapped(
    WorkshopOpenProductDetailTapped event,
    Emitter<WorkshopState> emit,
  ) async {
    await pushProductDetail(event.productId);
    await _loadProducts(emit);
  }

  Future<void> _loadProducts(Emitter<WorkshopState> emit) async {
    emit(state.copyWith(status: WorkshopStatus.loading, errorMessage: null));

    try {
      final products =
          await _productRepository.getByState(ProductState.workbench);
      final allMaterials = await _materialRepository.getAll();
      final materialById = {for (final m in allMaterials) m.id: m};
      final reservedById =
          await _materialRepository.getReservedQuantitiesByMaterialId();
      final usedByProductId =
          await _productRepository.getUsedMaterialsByProductId(
        products.map((p) => p.id).toList(),
      );

      final projects = [
        for (final product in products)
          _toProjectItem(
            product,
            materialById: materialById,
            reservedById: reservedById,
            usedMaterials: usedByProductId[product.id] ?? const [],
          ),
      ];
      projects.sort(
        (a, b) => a.product.presetName
            .toLowerCase()
            .compareTo(b.product.presetName.toLowerCase()),
      );

      emit(
        state.copyWith(
          status: WorkshopStatus.loaded,
          projects: projects,
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed loaded workshop products: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: WorkshopStatus.failure,
          errorMessage: UiErrorCodes.loadFailure,
        ),
      );
    }
  }

  WorkshopProjectItem _toProjectItem(
    Product product, {
    required Map<String, domain.Material> materialById,
    required Map<String, double> reservedById,
    required List<UsedMaterial> usedMaterials,
  }) {
    var hasMaterialShortage = false;
    if (product.state == ProductState.workbench) {
      for (final used in usedMaterials) {
        final onHand = materialById[used.materialId]?.quantity ?? 0;
        final reserved = reservedById[used.materialId] ?? 0;
        if (reserved > onHand) {
          hasMaterialShortage = true;
          break;
        }
      }
    }

    return WorkshopProjectItem(
      product: product,
      hasMaterialShortage: hasMaterialShortage,
    );
  }
}
