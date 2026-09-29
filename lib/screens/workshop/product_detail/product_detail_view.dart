import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/models/product_state.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/components/preset/preset_add_material_sheet.dart';
import 'package:instock/screens/components/preset/preset_inline_editable_text.dart';
import 'package:instock/screens/components/preset/preset_material_quantity_popover.dart';
import 'package:instock/screens/components/preset/preset_material_tag.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_bloc.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_event.dart';
import 'package:instock/screens/workshop/product_detail/product_detail_state.dart';
import 'package:instock/theme/app_theme.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<ProductDetailBloc, ProductDetailState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage &&
              current.errorMessage != null,
          listener: (context, state) {
            final message = switch (state.errorMessage) {
              UiErrorCodes.finishFailure => l10n.workshopFinishFailure,
              UiErrorCodes.notFound => l10n.workshopDetailNotFound,
              UiErrorCodes.loadFailure => l10n.workshopDetailLoadFailure,
              _ => l10n.workshopDetailActionFailure,
            };
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
        ),
        BlocListener<ProductDetailBloc, ProductDetailState>(
          listenWhen: (previous, current) =>
              previous.product?.state == ProductState.workbench &&
              current.product?.state == ProductState.finished,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.workshopFinishSuccess)),
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const BackButtonIcon(),
            onPressed: () => context.read<ProductDetailBloc>().add(
                  const ProductDetailBackTapped(),
                ),
          ),
          title: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            buildWhen: (previous, current) =>
                previous.product?.presetName != current.product?.presetName,
            builder: (context, state) {
              return Text(
                state.product?.presetName ?? l10n.workshopProductDetailTitle,
              );
            },
          ),
        ),
        body: _ProductDetailBody(l10n: l10n),
      ),
    );
  }
}

class _ProductDetailBody extends StatelessWidget {
  const _ProductDetailBody({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        if (state.status == ProductDetailStatus.initial ||
            (state.status == ProductDetailStatus.loading &&
                state.product == null)) {
          return const Center(child: CircularProgressIndicator());
        }

        final product = state.product;
        if (product == null) {
          return Center(
            child: Text(
              l10n.workshopDetailLoadFailure,
              style: textTheme.bodyLarge?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          );
        }

        final editable = state.isEditable;
        final bloc = context.read<ProductDetailBloc>();

        void updateProduct({
          String? presetName,
          String? presetDescription,
          String? customer,
        }) {
          if (!editable) {
            return;
          }
          bloc.add(
            ProductDetailProductUpdated(
              presetName: presetName ?? product.presetName,
              presetDescription:
                  presetDescription ?? product.presetDescription,
              customer: customer ?? product.customer,
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.lg,
          ),
          children: [
            _StatusChip(
              label: product.state == ProductState.workbench
                  ? l10n.workshopStatusInProgress
                  : l10n.workshopStatusFinished,
              isActive: product.state == ProductState.workbench,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.workshopProductNameLabel,
              style: textTheme.labelLarge?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            if (editable)
              PresetInlineEditableText(
                text: product.presetName,
                required: true,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                onCommit: (name) => updateProduct(presetName: name),
              )
            else
              Text(
                product.presetName,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.workshopProductDescriptionLabel,
              style: textTheme.labelLarge?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            if (editable)
              PresetInlineEditableText(
                text: product.presetDescription,
                placeholder: l10n.productsDetailNoDescription,
                placeholderStyle: textTheme.bodyLarge?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                  height: 1.45,
                ),
                style: textTheme.bodyLarge?.copyWith(
                  color: scheme.onSurface,
                  height: 1.45,
                ),
                maxLines: null,
                onCommit: (description) =>
                    updateProduct(presetDescription: description),
              )
            else
              Text(
                product.presetDescription.isEmpty
                    ? l10n.productsDetailNoDescription
                    : product.presetDescription,
                style: textTheme.bodyLarge?.copyWith(
                  color: product.presetDescription.isEmpty
                      ? scheme.onSurfaceVariant
                      : scheme.onSurface,
                  fontStyle: product.presetDescription.isEmpty
                      ? FontStyle.italic
                      : FontStyle.normal,
                  height: 1.45,
                ),
              ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.workshopCustomerFieldLabel,
              style: textTheme.labelLarge?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            if (editable)
              PresetInlineEditableText(
                text: product.customer,
                placeholder: l10n.workshopCustomerPlaceholder,
                placeholderStyle: textTheme.bodyLarge?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
                style: textTheme.bodyLarge?.copyWith(
                  color: scheme.onSurface,
                ),
                onCommit: (customer) => updateProduct(customer: customer),
              )
            else
              Text(
                product.customer.isEmpty
                    ? l10n.workshopCustomerPlaceholder
                    : product.customer,
                style: textTheme.bodyLarge?.copyWith(
                  color: product.customer.isEmpty
                      ? scheme.onSurfaceVariant
                      : scheme.onSurface,
                  fontStyle: product.customer.isEmpty
                      ? FontStyle.italic
                      : FontStyle.normal,
                ),
              ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.productsDetailMaterialsHeading,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _MaterialSection(
              state: state,
              l10n: l10n,
              editable: editable,
            ),
            if (editable) ...[
              const SizedBox(height: AppSpacing.xl),
              _FinishProductButton(
                l10n: l10n,
                isSaving: state.status == ProductDetailStatus.saving,
              ),
              const SizedBox(height: AppSpacing.sm),
              _RemoveProductButton(
                l10n: l10n,
                productName: product.presetName,
                isSaving: state.status == ProductDetailStatus.saving,
              ),
            ],
            if (state.status == ProductDetailStatus.saving)
              const Padding(
                padding: EdgeInsets.only(top: AppSpacing.lg),
                child: LinearProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.isActive,
  });

  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final background =
        isActive ? scheme.tertiaryContainer : scheme.surfaceContainerHighest;
    final foreground =
        isActive ? scheme.onTertiaryContainer : scheme.onSurfaceVariant;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: foreground,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _MaterialSection extends StatefulWidget {
  const _MaterialSection({
    required this.state,
    required this.l10n,
    required this.editable,
  });

  final ProductDetailState state;
  final AppLocalizations l10n;
  final bool editable;

  @override
  State<_MaterialSection> createState() => _MaterialSectionState();
}

class _MaterialSectionState extends State<_MaterialSection> {
  final _anchorKeys = <String, GlobalKey>{};

  GlobalKey _keyFor(String lineId) =>
      _anchorKeys.putIfAbsent(lineId, GlobalKey.new);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final bloc = context.read<ProductDetailBloc>();
    final lines = widget.state.materialLines;

    if (lines.isEmpty && !widget.editable) {
      return Text(
        widget.l10n.workshopAddMaterialEmpty,
        style: textTheme.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            ...lines.map((item) {
              final key = _keyFor(item.line.id);
              return WorkshopMaterialTag(
                key: key,
                label: item.materialTitle,
                quantityLabel:
                    formatWorkshopMaterialQuantity(item.line.quantity),
                isShortage: item.isShortage,
                enabled: widget.editable,
                onTap: () => showPresetMaterialQuantityPopover(
                  context: context,
                  anchorKey: key,
                  materialTitle: item.materialTitle,
                  quantity: item.line.quantity,
                  onQuantityChanged: (quantity) {
                    bloc.add(
                      ProductDetailQuantityChanged(
                        lineId: item.line.id,
                        quantity: quantity,
                      ),
                    );
                  },
                ),
              );
            }),
              if (widget.editable)
              PresetAddMaterialTag(
                label: widget.l10n.productsAddMaterial,
                onTap: () => showPresetAddMaterialSheet(
                  context: context,
                  materials: widget.state.addableMaterials,
                  title: widget.l10n.workshopAddMaterialTitle,
                  emptyMessage: widget.l10n.workshopAddMaterialEmpty,
                  onMaterialSelected: (material) {
                    bloc.add(ProductDetailMaterialAdded(material.id));
                  },
                ),
              ),
          ],
        ),
        ...lines.where((item) => item.isShortage).map((item) {
          return Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: _ShortageInfo(
              materialTitle: item.materialTitle,
              reservedLabel: widget.l10n.workshopMaterialGlobalReserved(
                formatWorkshopStockQuantity(item.globalReservedQuantity),
                formatWorkshopStockQuantity(item.onHandQuantity),
              ),
              shortageLabel: widget.l10n.workshopMaterialShortage,
            ),
          );
        }),
      ],
    );
  }
}

class _FinishProductButton extends StatelessWidget {
  const _FinishProductButton({
    required this.l10n,
    required this.isSaving,
  });

  final AppLocalizations l10n;
  final bool isSaving;

  Future<void> _confirmFinish(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.workshopFinishConfirmTitle),
        content: Text(l10n.workshopFinishConfirmMessage),
        actions: [
          TextButton(
            // Local dialog dismiss only — route-level nav is BLoC-owned.
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.inventoryCancel),
          ),
          FilledButton(
            // Local dialog dismiss only — route-level nav is BLoC-owned.
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.workshopFinishProduct),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      context.read<ProductDetailBloc>().add(const ProductDetailFinishRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isSaving ? null : () => _confirmFinish(context),
      child: Text(l10n.workshopFinishProduct),
    );
  }
}

class _RemoveProductButton extends StatelessWidget {
  const _RemoveProductButton({
    required this.l10n,
    required this.productName,
    required this.isSaving,
  });

  final AppLocalizations l10n;
  final String productName;
  final bool isSaving;

  Future<void> _confirmRemove(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final scheme = Theme.of(dialogContext).colorScheme;
        return AlertDialog(
          title: Text(l10n.workshopRemoveConfirmTitle),
          content: Text(l10n.workshopRemoveConfirmMessage(productName)),
          actions: [
            TextButton(
              // Local dialog dismiss only — route-level nav is BLoC-owned.
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(l10n.inventoryCancel),
            ),
            FilledButton(
              // Local dialog dismiss only — route-level nav is BLoC-owned.
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: scheme.error,
                foregroundColor: scheme.onError,
              ),
              child: Text(l10n.workshopRemoveProduct),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      context
          .read<ProductDetailBloc>()
          .add(const ProductDetailRemoveRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: isSaving ? null : () => _confirmRemove(context),
      style: TextButton.styleFrom(
        foregroundColor: scheme.error,
      ),
      child: Text(l10n.workshopRemoveProduct),
    );
  }
}

class _ShortageInfo extends StatelessWidget {
  const _ShortageInfo({
    required this.materialTitle,
    required this.reservedLabel,
    required this.shortageLabel,
  });

  final String materialTitle;
  final String reservedLabel;
  final String shortageLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Color.alphaBlend(
          scheme.errorContainer.withValues(alpha: 0.35),
          scheme.surfaceContainerLow,
        ),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            materialTitle,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: scheme.onErrorContainer,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            shortageLabel,
            style: textTheme.labelMedium?.copyWith(
              color: scheme.onErrorContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            reservedLabel,
            style: textTheme.bodySmall?.copyWith(
              color: scheme.onErrorContainer.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}

// --- folded from workshop_material_tag.dart ---

class WorkshopMaterialTag extends StatelessWidget {
  const WorkshopMaterialTag({
    super.key,
    required this.label,
    required this.quantityLabel,
    required this.isShortage,
    required this.onTap,
    this.enabled = true,
  });

  final String label;
  final String quantityLabel;
  final bool isShortage;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    final background = isShortage
        ? scheme.errorContainer.withValues(alpha: 0.75)
        : scheme.secondaryContainer.withValues(alpha: 0.65);
    final foreground =
        isShortage ? scheme.onErrorContainer : scheme.onSecondaryContainer;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(AppRadius.full),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(AppRadius.full),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: textTheme.labelLarge?.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: ' $quantityLabel',
                  style: textTheme.labelLarge?.copyWith(
                    color: foreground.withValues(alpha: 0.75),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatWorkshopMaterialQuantity(double quantity) {
  if (quantity == quantity.roundToDouble()) {
    return '× ${quantity.toInt()}';
  }
  final text = quantity.toString();
  final trimmed =
      text.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  return '× $trimmed';
}

String formatWorkshopStockQuantity(double value) {
  if (value == value.roundToDouble()) {
    return value.toInt().toString();
  }
  return value.toStringAsFixed(1);
}
