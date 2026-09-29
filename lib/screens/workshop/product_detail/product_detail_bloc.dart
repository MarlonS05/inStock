import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/entities/used_material.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/domain/repositories/material_repository.dart';
import 'package:instock/domain/repositories/product_repository.dart';
import 'package:instock/domain/use_cases/product/delete_product_use_case.dart';
import 'package:instock/domain/use_cases/product/delete_used_material_use_case.dart';
import 'package:instock/domain/use_cases/product/finish_product_use_case.dart';
import 'package:instock/domain/use_cases/product/save_used_material_use_case.dart';
import 'package:instock/domain/use_cases/product/update_product_use_case.dart';
import 'package:instock/logger/logger.dart';
import 'package:instock/router/app_router.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_event.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_state.dart';
import 'package:uuid/uuid.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(
    this._productRepository,
    this._materialRepository,
    this._updateProduct,
    this._saveUsedMaterial,
    this._deleteUsedMaterial,
    this._finishProduct,
    this._deleteProduct,
  ) : super(const ProductDetailState()) {
    on<ProductDetailStarted>(_onStarted);
    on<ProductDetailProductUpdated>(_onProductUpdated);
    on<ProductDetailQuantityChanged>(_onQuantityChanged);
    on<ProductDetailMaterialAdded>(_onMaterialAdded);
    on<ProductDetailFinishRequested>(_onFinishRequested);
    on<ProductDetailRemoveRequested>(_onRemoveRequested);
    on<ProductDetailBackTapped>(_onBackTapped);
  }

  final ProductRepository _productRepository;
  final MaterialRepository _materialRepository;
  final UpdateProductUseCase _updateProduct;
  final SaveUsedMaterialUseCase _saveUsedMaterial;
  final DeleteUsedMaterialUseCase _deleteUsedMaterial;
  final FinishProductUseCase _finishProduct;
  final DeleteProductUseCase _deleteProduct;
  final _uuid = const Uuid();

  String? _productId;

  Future<void> _onStarted(
    ProductDetailStarted event,
    Emitter<ProductDetailState> emit,
  ) async {
    _productId = event.productId;
    await _load(emit);
  }

  Future<void> _onProductUpdated(
    ProductDetailProductUpdated event,
    Emitter<ProductDetailState> emit,
  ) async {
    final product = state.product;
    if (product == null || product.state != ProductState.workbench) {
      return;
    }

    final trimmedName = event.presetName.trim();
    if (trimmedName.isEmpty) {
      return;
    }

    final trimmedDescription = event.presetDescription.trim();
    final trimmedCustomer = event.customer.trim();
    if (trimmedName == product.presetName &&
        trimmedDescription == product.presetDescription &&
        trimmedCustomer == product.customer) {
      return;
    }

    emit(
      state.copyWith(
        status: ProductDetailStatus.saving,
        errorMessage: null,
        isFinishFailure: false,
      ),
    );

    try {
      final updated = product.copyWith(
        presetName: trimmedName,
        presetDescription: trimmedDescription,
        customer: trimmedCustomer,
      );
      await _updateProduct(updated);
      logger.i('Success saved product ${updated.id}');
      emit(
        state.copyWith(
          status: ProductDetailStatus.loaded,
          product: updated,
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed saved product: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  Future<void> _onQuantityChanged(
    ProductDetailQuantityChanged event,
    Emitter<ProductDetailState> emit,
  ) async {
    final product = state.product;
    if (product == null || product.state != ProductState.workbench) {
      return;
    }

    emit(
      state.copyWith(
        status: ProductDetailStatus.saving,
        errorMessage: null,
        isFinishFailure: false,
      ),
    );

    try {
      if (event.quantity <= 0) {
        await _deleteUsedMaterial(event.lineId);
        logger.i('Success removed used material ${event.lineId}');
      } else {
        final existing = state.materialLines
            .firstWhere((line) => line.line.id == event.lineId)
            .line;
        await _saveUsedMaterial(existing.copyWith(quantity: event.quantity));
        logger.i('Success updated used material ${event.lineId}');
      }
      await _load(emit, showLoading: false);
    } catch (error, stackTrace) {
      logger.w('Failed updated used material: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  Future<void> _onMaterialAdded(
    ProductDetailMaterialAdded event,
    Emitter<ProductDetailState> emit,
  ) async {
    final productId = _productId;
    final product = state.product;
    if (productId == null ||
        product == null ||
        product.state != ProductState.workbench) {
      return;
    }

    emit(
      state.copyWith(
        status: ProductDetailStatus.saving,
        errorMessage: null,
        isFinishFailure: false,
      ),
    );

    try {
      final line = UsedMaterial(
        id: _uuid.v4(),
        productId: productId,
        materialId: event.materialId,
        quantity: 1,
      );
      await _saveUsedMaterial(line);
      logger.i('Success added used material ${line.id}');
      await _load(emit, showLoading: false);
    } catch (error, stackTrace) {
      logger.w('Failed added used material: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  Future<void> _onFinishRequested(
    ProductDetailFinishRequested event,
    Emitter<ProductDetailState> emit,
  ) async {
    final productId = _productId;
    final product = state.product;
    if (productId == null ||
        product == null ||
        product.state != ProductState.workbench) {
      return;
    }

    emit(
      state.copyWith(
        status: ProductDetailStatus.saving,
        errorMessage: null,
        isFinishFailure: false,
      ),
    );

    try {
      await _finishProduct(productId);
      logger.i('Success finished product $productId');
      await _load(emit, showLoading: false);
    } catch (error, stackTrace) {
      logger.w('Failed finished product: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductDetailStatus.loaded,
          errorMessage: UiErrorCodes.finishFailure,
          isFinishFailure: true,
        ),
      );
    }
  }

  Future<void> _onRemoveRequested(
    ProductDetailRemoveRequested event,
    Emitter<ProductDetailState> emit,
  ) async {
    final productId = _productId;
    final product = state.product;
    if (productId == null ||
        product == null ||
        product.state != ProductState.workbench) {
      return;
    }

    emit(
      state.copyWith(
        status: ProductDetailStatus.saving,
        errorMessage: null,
        isFinishFailure: false,
      ),
    );

    try {
      await _deleteProduct(productId);
      logger.i('Success removed product $productId');
      popRoute();
    } catch (error, stackTrace) {
      logger.w('Failed removed product: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductDetailStatus.failure,
          errorMessage: UiErrorCodes.actionFailure,
        ),
      );
    }
  }

  void _onBackTapped(
    ProductDetailBackTapped event,
    Emitter<ProductDetailState> emit,
  ) {
    popRoute();
  }

  Future<void> _load(
    Emitter<ProductDetailState> emit, {
    bool showLoading = true,
  }) async {
    final productId = _productId;
    if (productId == null) {
      return;
    }

    if (showLoading) {
      emit(
        state.copyWith(status: ProductDetailStatus.loading, errorMessage: null),
      );
    }

    try {
      final product = await _productRepository.getById(productId);
      if (product == null) {
        emit(
          state.copyWith(
            status: ProductDetailStatus.failure,
            errorMessage: UiErrorCodes.notFound,
          ),
        );
        return;
      }

      final usedMaterials = await _productRepository.getUsedMaterials(
        productId,
      );
      final allMaterials = await _materialRepository.getAll();
      final reservedById =
          await _materialRepository.getReservedQuantitiesByMaterialId();
      final materialById = {for (final m in allMaterials) m.id: m};

      final lines = [
        for (final used in usedMaterials)
          ProductMaterialLine(
            line: used,
            materialTitle:
                materialById[used.materialId]?.title ?? used.materialId,
            onHandQuantity: materialById[used.materialId]?.quantity ?? 0,
            globalReservedQuantity: reservedById[used.materialId] ?? 0,
          ),
      ];
      lines.sort(
        (a, b) => a.materialTitle.toLowerCase().compareTo(
          b.materialTitle.toLowerCase(),
        ),
      );

      emit(
        state.copyWith(
          status: ProductDetailStatus.loaded,
          product: product,
          materialLines: lines,
          allMaterials: allMaterials,
          errorMessage: null,
        ),
      );
    } catch (error, stackTrace) {
      logger.w('Failed loaded product detail: $error\n$stackTrace');
      emit(
        state.copyWith(
          status: ProductDetailStatus.failure,
          errorMessage: UiErrorCodes.loadFailure,
        ),
      );
    }
  }
}
