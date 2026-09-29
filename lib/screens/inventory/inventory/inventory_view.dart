import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/entities/material.dart' as domain;
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/components/app_card.dart';
import 'package:instock/screens/components/app_empty_state.dart';
import 'package:instock/screens/components/search/app_search_field.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/inventory/inventory/inventory_bloc.dart';
import 'package:instock/screens/inventory/inventory/inventory_event.dart';
import 'package:instock/screens/inventory/inventory/inventory_state.dart';
import 'package:instock/theme/app_theme.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return BlocListener<InventoryBloc, InventoryState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == InventoryStatus.failure,
      listener: (context, state) {
        final message = switch (state.errorMessage) {
          UiErrorCodes.materialInUse => l10n.inventoryDeleteInUse,
          UiErrorCodes.actionFailure => l10n.inventoryActionFailure,
          _ => l10n.inventoryLoadFailure,
        };
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      },
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.lg,
                    AppSpacing.md,
                    0,
                  ),
                  child: Text(
                    l10n.inventoryTitle,
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.md,
                    AppSpacing.sm,
                  ),
                  child: AppSearchField(
                    hintText: l10n.inventorySearchHint,
                    onChanged: (query) => context
                        .read<InventoryBloc>()
                        .add(InventorySearchChanged(query)),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<InventoryBloc, InventoryState>(
                    builder: (context, state) {
                      if (state.status == InventoryStatus.initial ||
                          state.status == InventoryStatus.loading &&
                              state.items.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final items = state.visibleItems;

                      if (state.items.isEmpty) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            context
                                .read<InventoryBloc>()
                                .add(const InventoryRefreshRequested());
                            await context
                                .read<InventoryBloc>()
                                .stream
                                .firstWhere(
                                  (s) => s.status != InventoryStatus.loading,
                                );
                          },
                          child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.45,
                                child: AppEmptyState(
                                  icon: Icons.inventory_2_outlined,
                                  title: l10n.inventoryEmptyTitle,
                                  subtitle: l10n.inventoryEmptySubtitle,
                                  actionLabel: l10n.inventoryAddMaterial,
                                  onAction: () => showMaterialFormPopup(context),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      if (items.isEmpty) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            context
                                .read<InventoryBloc>()
                                .add(const InventoryRefreshRequested());
                            await context
                                .read<InventoryBloc>()
                                .stream
                                .firstWhere(
                                  (s) => s.status != InventoryStatus.loading,
                                );
                          },
                          child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.35,
                                child: AppEmptyState(
                                  icon: Icons.search_off_outlined,
                                  title: l10n.inventoryNoResultsTitle,
                                  subtitle: l10n.inventoryNoResultsSubtitle,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<InventoryBloc>()
                              .add(const InventoryRefreshRequested());
                          await context.read<InventoryBloc>().stream.firstWhere(
                                (s) => s.status != InventoryStatus.loading,
                              );
                        },
                        child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(
                            AppSpacing.md,
                            AppSpacing.sm,
                            AppSpacing.md,
                            AppSpacing.xxl + AppSpacing.lg,
                          ),
                          itemCount: items.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: AppSpacing.sm),
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return MaterialListTile(
                              item: item,
                              l10n: l10n,
                              onTap: () => showMaterialFormPopup(
                                context,
                                material: item.material,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              right: AppSpacing.md,
              bottom: AppSpacing.md,
              child: FloatingActionButton(
                onPressed: () => showMaterialFormPopup(context),
                elevation: 0,
                child: Icon(Icons.add_rounded, color: scheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- folded from material_list_tile.dart ---

class MaterialListTile extends StatelessWidget {
  const MaterialListTile({
    super.key,
    required this.item,
    required this.l10n,
    required this.onTap,
  });

  final MaterialListItem item;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final material = item.material;

    final cardColor = item.isLowStock
        ? Color.alphaBlend(
            scheme.errorContainer.withValues(alpha: 0.35),
            scheme.surfaceContainerLow,
          )
        : null;

    final showStatusChips = item.isLowStock;

    return AppCard(
      onTap: onTap,
      color: cardColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: scheme.primaryContainer.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: scheme.onPrimaryContainer,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  material.title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (material.description.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    material.description,
                    style: textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
                if (showStatusChips) ...[
                  const SizedBox(height: AppSpacing.sm),
                  _StatusChip(
                    label: l10n.inventoryLowStock,
                    background: scheme.errorContainer,
                    foreground: scheme.onErrorContainer,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            l10n.inventoryAvailableInStock(
              _formatQuantity(item.availableQuantity),
              _formatQuantity(material.quantity),
            ),
            style: textTheme.labelMedium?.copyWith(
              color: scheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  static String _formatQuantity(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        label,
        style: textTheme.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


// --- folded from material_form_popup.dart ---

/// Centered popup for creating or editing a material.
Future<void> showMaterialFormPopup(
  BuildContext context, {
  domain.Material? material,
}) {
  final bloc = context.read<InventoryBloc>();

  return showDialog<void>(
    context: context,
    builder: (dialogContext) => BlocProvider.value(
      value: bloc,
      child: MaterialFormPopup(material: material),
    ),
  );
}

class MaterialFormPopup extends StatefulWidget {
  const MaterialFormPopup({super.key, this.material});

  final domain.Material? material;

  @override
  State<MaterialFormPopup> createState() => _MaterialFormPopupState();
}

class _MaterialFormPopupState extends State<MaterialFormPopup> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _quantityController;
  final _quantityFocusNode = FocusNode();
  String? _nameError;
  String? _quantityError;
  String? _imagePath;
  Uint8List? _previewBytes;

  bool get _isEditing => widget.material != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.material?.title ?? '');
    _descriptionController = TextEditingController(
      text: widget.material?.description ?? '',
    );
    _quantityController = TextEditingController(
      text: widget.material != null
          ? _formatQuantity(widget.material!.quantity)
          : '0',
    );
    _imagePath = widget.material?.image;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
    _quantityFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    const sectionGap = AppSpacing.xs;
    const sectionPadding = EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<InventoryBloc, InventoryState>(
          listenWhen: (previous, current) =>
              current.pickedImageBytes != null &&
              current.pickedImageMaterialId == widget.material?.id &&
              (previous.pickedImageBytes != current.pickedImageBytes ||
                  previous.pickedImageMaterialId !=
                      current.pickedImageMaterialId),
          listener: (context, state) {
            final bytes = state.pickedImageBytes;
            if (bytes == null) {
              return;
            }
            setState(() => _previewBytes = bytes);
            context.read<InventoryBloc>().add(
                  const InventoryPickedImagePreviewConsumed(),
                );
          },
        ),
        BlocListener<InventoryBloc, InventoryState>(
          listenWhen: (previous, current) =>
              !previous.imagePickFailed && current.imagePickFailed,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.inventoryImagePickFailure)),
            );
            context.read<InventoryBloc>().add(
                  const InventoryImagePickFailureConsumed(),
                );
          },
        ),
      ],
      child: Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.xl,
      ),
      child: AnimatedPadding(
        duration: AppDuration.fast,
        curve: Curves.easeOut,
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _PopupSection(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.lg),
                ),
                padding: sectionPadding,
                child: TextField(
                  controller: _titleController,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: l10n.inventoryMaterialName,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    errorText: _nameError,
                    errorStyle: textTheme.bodySmall?.copyWith(
                      color: scheme.error,
                    ),
                  ),
                  onChanged: (_) {
                    if (_nameError != null) {
                      setState(() => _nameError = null);
                    }
                  },
                ),
              ),
              const SizedBox(height: sectionGap),
              _PopupSection(
                padding: sectionPadding,
                child: TextField(
                  controller: _descriptionController,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,
                  minLines: 1,
                  maxLines: 3,
                  style: textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: l10n.inventoryMaterialDescription,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              if (_isEditing) ...[
                const SizedBox(height: sectionGap),
                BlocListener<InventoryBloc, InventoryState>(
                  listenWhen: (previous, current) =>
                      previous.items != current.items,
                  listener: (context, state) {
                    final id = widget.material?.id;
                    if (id == null) {
                      return;
                    }
                    for (final item in state.items) {
                      if (item.material.id == id) {
                        setState(() {
                          _imagePath = item.material.image;
                          _previewBytes = null;
                        });
                        return;
                      }
                    }
                  },
                  child: Tooltip(
                    message: l10n.inventoryEditImage,
                    child: _PopupSection(
                      onTap: () => _pickImage(context, l10n),
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: _MaterialImagePreview(
                          previewBytes: _previewBytes,
                          imagePath: _imagePath,
                          scheme: scheme,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: sectionGap),
              _PopupSection(
                onTap: () => _quantityFocusNode.requestFocus(),
                padding: sectionPadding,
                child: TextField(
                  controller: _quantityController,
                  focusNode: _quantityFocusNode,
                  textAlign: TextAlign.center,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: scheme.primary,
                  ),
                  decoration: InputDecoration(
                    hintText: '0',
                    hintStyle: textTheme.titleLarge?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    errorText: _quantityError,
                    errorStyle: textTheme.bodySmall?.copyWith(
                      color: scheme.error,
                    ),
                  ),
                  onChanged: (_) {
                    if (_quantityError != null) {
                      setState(() => _quantityError = null);
                    }
                  },
                ),
              ),
              const SizedBox(height: sectionGap),
              Row(
                children: [
                  Expanded(
                    child: Tooltip(
                      message: l10n.productsMaterialQuantityDecrease,
                      child: _PopupSection(
                        onTap: () => _adjustQuantity(-1),
                        padding: sectionPadding,
                        child: Icon(
                          Icons.remove_rounded,
                          color: scheme.onSurface,
                          semanticLabel:
                              l10n.productsMaterialQuantityDecrease,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: sectionGap),
                  Expanded(
                    child: Tooltip(
                      message: l10n.productsMaterialQuantityIncrease,
                      child: _PopupSection(
                        onTap: () => _adjustQuantity(1),
                        padding: sectionPadding,
                        child: Icon(
                          Icons.add_rounded,
                          color: scheme.onSurface,
                          semanticLabel:
                              l10n.productsMaterialQuantityIncrease,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: sectionGap),
              if (_isEditing) ...[
                _PopupSection(
                  color: scheme.error,
                  onTap: () => _confirmDelete(context, l10n),
                  padding: sectionPadding,
                  child: Text(
                    l10n.inventoryDelete,
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium?.copyWith(
                      color: scheme.onError,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: sectionGap),
              ],
              _PopupSection(
                color: scheme.primary,
                onTap: _save,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(AppRadius.lg),
                ),
                padding: sectionPadding,
                child: Text(
                  l10n.inventorySave,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    color: scheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Future<void> _pickImage(BuildContext context, AppLocalizations l10n) async {
    final material = widget.material;
    if (material == null) {
      return;
    }

    context.read<InventoryBloc>().add(
          InventoryMaterialImagePickRequested(material.id),
        );
  }

  void _adjustQuantity(double delta) {
    final current = double.tryParse(_quantityController.text.trim()) ?? 0;
    final next = current + delta;
    if (next < 0) {
      return;
    }
    setState(() {
      _quantityController.text = _formatQuantity(next);
      _quantityError = null;
    });
  }

  void _save() {
    final l10n = AppLocalizations.of(context);
    final title = _titleController.text.trim();
    final quantityText = _quantityController.text.trim();
    var valid = true;

    String? nameError;
    String? quantityError;

    if (title.isEmpty) {
      nameError = l10n.inventoryNameRequired;
      valid = false;
    }

    if (quantityText.isEmpty) {
      quantityError = l10n.inventoryQuantityRequired;
      valid = false;
    } else {
      final parsed = double.tryParse(quantityText);
      if (parsed == null || parsed < 0) {
        quantityError = l10n.inventoryQuantityInvalid;
        valid = false;
      }
    }

    if (!valid) {
      setState(() {
        _nameError = nameError;
        _quantityError = quantityError;
      });
      return;
    }

    context.read<InventoryBloc>().add(
          InventoryMaterialSaved(
            id: widget.material?.id,
            title: title,
            description: _descriptionController.text,
            quantity: double.parse(quantityText),
          ),
        );
    // Local sheet dismiss only — route-level nav is BLoC-owned.
    Navigator.of(context).pop();
  }

  Future<void> _confirmDelete(
    BuildContext context,
    AppLocalizations l10n,
  ) async {
    final material = widget.material;
    if (material == null) {
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.inventoryDeleteConfirmTitle),
        content: Text(l10n.inventoryDeleteConfirmMessage(material.title)),
        actions: [
          TextButton(
            // Local dialog dismiss only — route-level nav is BLoC-owned.
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.inventoryCancel),
          ),
          FilledButton(
            // Local dialog dismiss only — route-level nav is BLoC-owned.
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.inventoryDelete),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) {
      return;
    }

    context.read<InventoryBloc>().add(
          InventoryMaterialDeleteRequested(material.id),
        );
    // Local sheet dismiss only — route-level nav is BLoC-owned.
    Navigator.of(context).pop();
  }

  static String _formatQuantity(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toString();
  }
}

class _PopupSection extends StatelessWidget {
  const _PopupSection({
    required this.child,
    this.onTap,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
  });

  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final content = Padding(
      padding: padding,
      child: child,
    );

    return Material(
      color: color ?? scheme.surfaceContainerHigh,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : InkWell(
              onTap: onTap,
              borderRadius: borderRadius,
              child: content,
            ),
    );
  }
}

class _MaterialImagePreview extends StatelessWidget {
  const _MaterialImagePreview({
    required this.previewBytes,
    required this.imagePath,
    required this.scheme,
  });

  final Uint8List? previewBytes;
  final String? imagePath;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    if (previewBytes != null) {
      return Image.memory(
        previewBytes!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 140,
      );
    }

    final path = imagePath;
    if (path != null && path.isNotEmpty) {
      final file = File(path);
      if (file.existsSync()) {
        return Image.file(
          file,
          key: ValueKey(file.lastModifiedSync()),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 140,
        );
      }
    }

    return Center(
      child: Icon(
        Icons.add_photo_alternate_outlined,
        size: 40,
        color: scheme.onSurfaceVariant.withValues(alpha: 0.45),
      ),
    );
  }
}
