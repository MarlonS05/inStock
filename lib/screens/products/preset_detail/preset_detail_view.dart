import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/entities/preset.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/components/preset/preset_add_material_sheet.dart';
import 'package:instock/screens/components/preset/preset_inline_editable_text.dart';
import 'package:instock/screens/components/preset/preset_material_quantity_popover.dart';
import 'package:instock/screens/components/preset/preset_material_tag.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_bloc.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_event.dart';
import 'package:instock/screens/products/preset_detail/preset_detail_state.dart';
import 'package:instock/theme/app_theme.dart';

class PresetDetailView extends StatelessWidget {
  const PresetDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;
    final heroHeight = screenHeight / 3;

    return MultiBlocListener(
      listeners: [
        BlocListener<PresetDetailBloc, PresetDetailState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage &&
              current.errorMessage != null,
          listener: (context, state) {
            final message = switch (state.errorMessage) {
              UiErrorCodes.notFound => l10n.productsDetailNotFound,
              UiErrorCodes.loadFailure => l10n.productsDetailLoadFailure,
              _ => l10n.productsDetailActionFailure,
            };
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
        ),
        BlocListener<PresetDetailBloc, PresetDetailState>(
          listenWhen: (previous, current) =>
              previous.createdProductId != current.createdProductId &&
              current.createdProductId != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.productsDetailCreateProductSuccess)),
            );
          },
        ),
        BlocListener<PresetDetailBloc, PresetDetailState>(
          listenWhen: (previous, current) =>
              !previous.imagePickFailed && current.imagePickFailed,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.productsDetailImagePickFailure)),
            );
            context.read<PresetDetailBloc>().add(
                  const PresetDetailImagePickFailureConsumed(),
                );
          },
        ),
      ],
      child: BlocBuilder<PresetDetailBloc, PresetDetailState>(
        builder: (context, state) {
          final preset = state.preset;
          final showActions = preset != null &&
              state.status != PresetDetailStatus.initial &&
              !(state.status == PresetDetailStatus.loading &&
                  state.preset == null);

          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) {
              if (didPop) {
                return;
              }
              context.read<PresetDetailBloc>().add(
                    const PresetDetailBackTapped(),
                  );
            },
            child: Scaffold(
              body: _PresetDetailBody(
                l10n: l10n,
                heroHeight: heroHeight,
              ),
              bottomNavigationBar: showActions
                  ? _PresetDetailActions(
                      l10n: l10n,
                      presetName: preset.name,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class _PresetDetailBody extends StatelessWidget {
  const _PresetDetailBody({
    required this.l10n,
    required this.heroHeight,
  });

  final AppLocalizations l10n;
  final double heroHeight;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return BlocBuilder<PresetDetailBloc, PresetDetailState>(
      builder: (context, state) {
        if (state.status == PresetDetailStatus.initial ||
            state.status == PresetDetailStatus.loading &&
                state.preset == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final preset = state.preset;
        if (preset == null) {
          return Center(
            child: Text(
              l10n.productsDetailNotFound,
              style: textTheme.bodyLarge?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          );
        }

        final bloc = context.read<PresetDetailBloc>();

        void updatePreset({String? name, String? description}) {
          bloc.add(
            PresetDetailPresetUpdated(
              name: name ?? preset.name,
              description: description ?? preset.description,
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  PresetHeroImage(preset: preset, height: heroHeight),
                  SizedBox(
                    height: heroHeight,
                    width: double.infinity,
                    child: PresetNameOverlay(
                      name: preset.name,
                      placeholder: l10n.productsPresetName,
                      onNameChanged: (name) => updatePreset(name: name),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.paddingOf(context).top + AppSpacing.sm,
                    left: AppSpacing.md,
                    child: PresetImageEditButton(
                      tooltip: l10n.productsDetailEditImage,
                      onPressed: () => bloc.add(
                        const PresetDetailImagePickRequested(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  AppSpacing.lg,
                  AppSpacing.md,
                  AppSpacing.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PresetInlineEditableText(
                      text: preset.description,
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
                          updatePreset(description: description),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      l10n.productsDetailMaterialsHeading,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _MaterialTagWrap(
                      state: state,
                      addLabel: l10n.productsAddMaterial,
                    ),
                    if (state.status == PresetDetailStatus.saving)
                      const Padding(
                        padding: EdgeInsets.only(top: AppSpacing.lg),
                        child: LinearProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PresetDetailActions extends StatelessWidget {
  const _PresetDetailActions({
    required this.l10n,
    required this.presetName,
  });

  final AppLocalizations l10n;
  final String presetName;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isSaving = context.select(
      (PresetDetailBloc bloc) =>
          bloc.state.status == PresetDetailStatus.saving,
    );

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.sm,
          AppSpacing.md,
          AppSpacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: isSaving
                  ? null
                  : () => context.read<PresetDetailBloc>().add(
                        const PresetDetailCreateProductRequested(),
                      ),
              child: Text(l10n.productsDetailCreateProduct),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.read<PresetDetailBloc>().add(
                          const PresetDetailBackTapped(),
                        ),
                    child: Text(l10n.productsDetailBack),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: TextButton(
                    onPressed: isSaving
                        ? null
                        : () => _confirmDelete(context, l10n, presetName),
                    style: TextButton.styleFrom(
                      foregroundColor: scheme.error,
                    ),
                    child: Text(l10n.inventoryDelete),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    AppLocalizations l10n,
    String name,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.productsDeleteConfirmTitle),
        content: Text(l10n.productsDeleteConfirmMessage(name)),
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

    if (confirmed == true && context.mounted) {
      context
          .read<PresetDetailBloc>()
          .add(const PresetDetailDeleteRequested());
    }
  }
}

class _MaterialTagWrap extends StatefulWidget {
  const _MaterialTagWrap({
    required this.state,
    required this.addLabel,
  });

  final PresetDetailState state;
  final String addLabel;

  @override
  State<_MaterialTagWrap> createState() => _MaterialTagWrapState();
}

class _MaterialTagWrapState extends State<_MaterialTagWrap> {
  final _anchorKeys = <String, GlobalKey>{};

  GlobalKey _keyFor(String lineId) =>
      _anchorKeys.putIfAbsent(lineId, GlobalKey.new);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PresetDetailBloc>();

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        ...widget.state.materialLines.map((item) {
          final key = _keyFor(item.line.id);
          return PresetMaterialTag(
            key: key,
            label: item.materialTitle,
            quantityLabel: formatPresetMaterialQuantity(item.line.quantity),
            onTap: () => showPresetMaterialQuantityPopover(
              context: context,
              anchorKey: key,
              materialTitle: item.materialTitle,
              quantity: item.line.quantity,
              onQuantityChanged: (quantity) {
                bloc.add(
                  PresetDetailQuantityChanged(
                    lineId: item.line.id,
                    quantity: quantity,
                  ),
                );
              },
            ),
          );
        }),
        PresetAddMaterialTag(
          label: widget.addLabel,
          onTap: () => showPresetAddMaterialSheet(
            context: context,
            materials: widget.state.addableMaterials,
            onMaterialSelected: (material) {
              bloc.add(PresetDetailMaterialAdded(material.id));
            },
          ),
        ),
      ],
    );
  }
}

// --- folded from preset_hero_image.dart ---

class PresetHeroImage extends StatelessWidget {
  const PresetHeroImage({
    super.key,
    required this.preset,
    required this.height,
  });

  final Preset preset;
  final double height;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final imagePath = preset.image;

    Widget imageChild;
    if (imagePath != null && imagePath.isNotEmpty) {
      final file = File(imagePath);
      if (file.existsSync()) {
        imageChild = Image.file(
          file,
          key: ValueKey(file.lastModifiedSync()),
          fit: BoxFit.contain,
          width: double.infinity,
          height: height,
        );
      } else {
        imageChild = _PlaceholderIcon(scheme: scheme);
      }
    } else {
      imageChild = _PlaceholderIcon(scheme: scheme);
    }

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ColoredBox(
        color: scheme.surfaceContainerHighest,
        child: imageChild,
      ),
    );
  }
}

class _PlaceholderIcon extends StatelessWidget {
  const _PlaceholderIcon({required this.scheme});

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.image_outlined,
        size: 72,
        color: scheme.onSurfaceVariant.withValues(alpha: 0.45),
      ),
    );
  }
}

class PresetImageEditButton extends StatelessWidget {
  const PresetImageEditButton({
    super.key,
    required this.onPressed,
    required this.tooltip,
  });

  final VoidCallback onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.45),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: IconButton(
        onPressed: onPressed,
        tooltip: tooltip,
        icon: const Icon(Icons.edit_outlined),
        color: Colors.white,
      ),
    );
  }
}

class PresetNameOverlay extends StatelessWidget {
  const PresetNameOverlay({
    super.key,
    required this.name,
    required this.onNameChanged,
    this.placeholder,
  });

  final String name;
  final ValueChanged<String> onNameChanged;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final nameStyle = textTheme.headlineMedium?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withValues(alpha: 0.55),
            Colors.transparent,
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: PresetInlineEditableText(
          text: name,
          placeholder: placeholder,
          placeholderStyle: nameStyle?.copyWith(
            color: Colors.white.withValues(alpha: 0.65),
            fontStyle: FontStyle.italic,
          ),
          style: nameStyle,
          cursorColor: Colors.white,
          required: true,
          padding: const EdgeInsets.all(AppSpacing.md),
          onCommit: onNameChanged,
        ),
      ),
    );
  }
}
