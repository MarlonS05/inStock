import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/components/app_card.dart';
import 'package:instock/screens/components/app_empty_state.dart';
import 'package:instock/screens/workshop/workshop/workshop_bloc.dart';
import 'package:instock/screens/workshop/workshop/workshop_event.dart';
import 'package:instock/screens/workshop/workshop/workshop_state.dart';
import 'package:instock/theme/app_theme.dart';

class WorkshopView extends StatelessWidget {
  const WorkshopView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<WorkshopBloc, WorkshopState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == WorkshopStatus.failure,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.workshopLoadFailure)),
        );
      },
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.sm,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.workshopTitle,
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.workshopOpenArchive,
                    onPressed: () => context.read<WorkshopBloc>().add(const WorkshopOpenArchiveTapped()),
                    icon: const Icon(Icons.inventory_2_outlined),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<WorkshopBloc, WorkshopState>(
                builder: (context, state) {
                  if (state.status == WorkshopStatus.initial ||
                      state.status == WorkshopStatus.loading &&
                          state.projects.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.projects.isEmpty) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<WorkshopBloc>()
                            .add(const WorkshopRefreshRequested());
                        await context.read<WorkshopBloc>().stream.firstWhere(
                              (s) => s.status != WorkshopStatus.loading,
                            );
                      },
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.45,
                            child: AppEmptyState(
                              icon: Icons.handyman_outlined,
                              title: l10n.workshopEmptyTitle,
                              subtitle: l10n.workshopEmptySubtitle,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<WorkshopBloc>()
                          .add(const WorkshopRefreshRequested());
                      await context.read<WorkshopBloc>().stream.firstWhere(
                            (s) => s.status != WorkshopStatus.loading,
                          );
                    },
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.md,
                        AppSpacing.sm,
                        AppSpacing.md,
                        AppSpacing.lg,
                      ),
                      itemCount: state.projects.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: AppSpacing.sm),
                      itemBuilder: (context, index) {
                        final project = state.projects[index];
                        return WorkshopProjectCard(
                          project: project,
                          l10n: l10n,
                          onTap: () => context.read<WorkshopBloc>().add(
                            WorkshopOpenProductDetailTapped(project.product.id),
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
      ),
    );
  }
}

// --- folded from workshop_project_card.dart ---

class WorkshopProjectCard extends StatelessWidget {
  const WorkshopProjectCard({
    super.key,
    required this.project,
    required this.l10n,
    this.onTap,
  });

  final WorkshopProjectItem project;
  final AppLocalizations l10n;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final product = project.product;
    final isActive = project.isActive;
    final showShortage = isActive && project.hasMaterialShortage;

    final statusLabel = isActive
        ? l10n.workshopStatusInProgress
        : l10n.workshopStatusFinished;
    final statusBackground =
        isActive ? scheme.tertiaryContainer : scheme.surfaceContainerHighest;
    final statusForeground =
        isActive ? scheme.onTertiaryContainer : scheme.onSurfaceVariant;

    final cardColor = showShortage
        ? Color.alphaBlend(
            scheme.errorContainer.withValues(alpha: 0.35),
            scheme.surfaceContainerLow,
          )
        : null;

    return AppCard(
      onTap: onTap,
      color: cardColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.presetName,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.workshopCustomerLabel(product.customer),
                  style: textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                if (showShortage) ...[
                  const SizedBox(height: AppSpacing.sm),
                  _ShortageChip(
                    label: l10n.workshopMaterialShortage,
                    background: scheme.errorContainer,
                    foreground: scheme.onErrorContainer,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          _StatusPill(
            label: statusLabel,
            background: statusBackground,
            foreground: statusForeground,
          ),
        ],
      ),
    );
  }
}

class _ShortageChip extends StatelessWidget {
  const _ShortageChip({
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

class _StatusPill extends StatelessWidget {
  const _StatusPill({
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
    );
  }
}
