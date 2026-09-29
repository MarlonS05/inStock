import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/components/app_card.dart';
import 'package:instock/screens/components/app_empty_state.dart';
import 'package:instock/screens/components/search/app_search_field.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/products/products/products_bloc.dart';
import 'package:instock/screens/products/products/products_event.dart';
import 'package:instock/screens/products/products/products_state.dart';
import 'package:instock/theme/app_theme.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return BlocListener<ProductsBloc, ProductsState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == ProductsStatus.failure,
      listener: (context, state) {
        final message = switch (state.errorMessage) {
          UiErrorCodes.createFailure => l10n.productsCreateFailure,
          UiErrorCodes.actionFailure => l10n.productsActionFailure,
          _ => l10n.productsLoadFailure,
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
                    l10n.productsTitle,
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
                    hintText: l10n.productsSearchHint,
                    onChanged: (query) => context
                        .read<ProductsBloc>()
                        .add(ProductsSearchChanged(query)),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state.status == ProductsStatus.initial ||
                          state.status == ProductsStatus.loading &&
                              state.items.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final items = state.visibleItems;

                      if (state.items.isEmpty) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            context
                                .read<ProductsBloc>()
                                .add(const ProductsRefreshRequested());
                            await context
                                .read<ProductsBloc>()
                                .stream
                                .firstWhere(
                                  (s) => s.status != ProductsStatus.loading,
                                );
                          },
                          child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.45,
                                child: AppEmptyState(
                                  icon: Icons.category_outlined,
                                  title: l10n.productsEmptyTitle,
                                  subtitle: l10n.productsEmptySubtitle,
                                  actionLabel: l10n.productsAddPreset,
                                  onAction: () =>
                                      context.read<ProductsBloc>().add(
                                    ProductsCreateAndOpenPresetTapped(
                                      defaultName: l10n.productsNewPresetDefaultName,
                                    ),
                                  ),
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
                                .read<ProductsBloc>()
                                .add(const ProductsRefreshRequested());
                            await context
                                .read<ProductsBloc>()
                                .stream
                                .firstWhere(
                                  (s) => s.status != ProductsStatus.loading,
                                );
                          },
                          child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.35,
                                child: AppEmptyState(
                                  icon: Icons.search_off_outlined,
                                  title: l10n.productsNoResultsTitle,
                                  subtitle: l10n.productsNoResultsSubtitle,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<ProductsBloc>()
                              .add(const ProductsRefreshRequested());
                          await context.read<ProductsBloc>().stream.firstWhere(
                                (s) => s.status != ProductsStatus.loading,
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
                            return ProductListTile(
                              item: item,
                              l10n: l10n,
                              onTap: () => context.read<ProductsBloc>().add(
                                ProductsOpenPresetDetailTapped(item.preset.id),
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
                onPressed: () => context.read<ProductsBloc>().add(
                                    ProductsCreateAndOpenPresetTapped(
                                      defaultName: l10n.productsNewPresetDefaultName,
                                    ),
                                  ),
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

// --- folded from product_list_tile.dart ---

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.item,
    required this.l10n,
    required this.onTap,
  });

  final ProductListItem item;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final preset = item.preset;

    return AppCard(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: scheme.secondaryContainer.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(
              Icons.category_outlined,
              color: scheme.onSecondaryContainer,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  preset.name,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (preset.description.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    preset.description,
                    style: textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.materialCount.toString(),
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.productsMaterialCountLabel,
                style: textTheme.labelSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
