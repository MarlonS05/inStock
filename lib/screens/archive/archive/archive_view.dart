import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/entities/product.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/archive/archive/archive_bloc.dart';
import 'package:instock/screens/archive/archive/archive_event.dart';
import 'package:instock/screens/archive/archive/archive_state.dart';
import 'package:instock/screens/components/app_card.dart';
import 'package:instock/screens/components/app_empty_state.dart';
import 'package:instock/screens/components/app_surface.dart';
import 'package:instock/theme/app_theme.dart';
import 'package:intl/intl.dart';

class ArchiveView extends StatelessWidget {
  const ArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final localeName = Localizations.localeOf(context).toString();

    return BlocListener<ArchiveBloc, ArchiveState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == ArchiveStatus.failure,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.archiveLoadFailure)),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const BackButtonIcon(),
            onPressed: () => context.read<ArchiveBloc>().add(
                  const ArchiveBackTapped(),
                ),
          ),
          title: Text(l10n.archiveTitle),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  AppSpacing.sm,
                  AppSpacing.md,
                  AppSpacing.sm,
                ),
                child: BlocBuilder<ArchiveBloc, ArchiveState>(
                  buildWhen: (previous, current) =>
                      previous.startDate != current.startDate ||
                      previous.endDate != current.endDate,
                  builder: (context, state) {
                    return ArchiveDateFilter(
                      startDate: state.startDate,
                      endDate: state.endDate,
                      localeName: localeName,
                      l10n: l10n,
                      onStartDateTap: () => _pickDate(
                        context,
                        isStart: true,
                        initialDate: state.startDate,
                      ),
                      onEndDateTap: () => _pickDate(
                        context,
                        isStart: false,
                        initialDate: state.endDate,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<ArchiveBloc, ArchiveState>(
                  builder: (context, state) {
                    if (state.status == ArchiveStatus.initial ||
                        state.status == ArchiveStatus.loading &&
                            state.products.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.products.isEmpty) {
                      return RefreshIndicator(
                        onRefresh: () => _refresh(context),
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.35,
                              child: AppEmptyState(
                                icon: Icons.inventory_2_outlined,
                                title: l10n.archiveEmptyTitle,
                                subtitle: l10n.archiveEmptySubtitle,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return RefreshIndicator(
                      onRefresh: () => _refresh(context),
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.md,
                          AppSpacing.sm,
                          AppSpacing.md,
                          AppSpacing.lg,
                        ),
                        itemCount: state.products.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: AppSpacing.sm),
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return ArchiveProductCard(
                            product: product,
                            l10n: l10n,
                            localeName: localeName,
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
      ),
    );
  }

  Future<void> _pickDate(
    BuildContext context, {
    required bool isStart,
    required DateTime initialDate,
  }) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: now,
    );
    if (picked == null || !context.mounted) {
      return;
    }

    final bloc = context.read<ArchiveBloc>();
    if (isStart) {
      bloc.add(ArchiveStartDateChanged(picked));
    } else {
      bloc.add(ArchiveEndDateChanged(picked));
    }
  }

  Future<void> _refresh(BuildContext context) async {
    context.read<ArchiveBloc>().add(const ArchiveRefreshRequested());
    await context.read<ArchiveBloc>().stream.firstWhere(
          (state) => state.status != ArchiveStatus.loading,
        );
  }
}

// --- folded from archive_date_filter.dart ---

class ArchiveDateFilter extends StatelessWidget {
  const ArchiveDateFilter({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.localeName,
    required this.l10n,
    required this.onStartDateTap,
    required this.onEndDateTap,
  });

  final DateTime startDate;
  final DateTime endDate;
  final String localeName;
  final AppLocalizations l10n;
  final VoidCallback onStartDateTap;
  final VoidCallback onEndDateTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final dateFormat = DateFormat.yMMMd(localeName);

    return AppSurface(
      radius: AppRadius.lg,
      elevation: AppElevationLevel.low,
      color: scheme.surfaceContainerLow,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Expanded(
            child: _DateField(
              label: l10n.archiveStartDateLabel,
              value: dateFormat.format(startDate),
              onTap: onStartDateTap,
              textTheme: textTheme,
              scheme: scheme,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: Icon(
              Icons.arrow_forward,
              size: 18,
              color: scheme.onSurfaceVariant,
            ),
          ),
          Expanded(
            child: _DateField(
              label: l10n.archiveEndDateLabel,
              value: dateFormat.format(endDate),
              onTap: onEndDateTap,
              textTheme: textTheme,
              scheme: scheme,
            ),
          ),
        ],
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.value,
    required this.onTap,
    required this.textTheme,
    required this.scheme,
  });

  final String label;
  final String value;
  final VoidCallback onTap;
  final TextTheme textTheme;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTheme.labelMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                value,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// --- folded from archive_product_card.dart ---

class ArchiveProductCard extends StatelessWidget {
  const ArchiveProductCard({
    super.key,
    required this.product,
    required this.l10n,
    required this.localeName,
  });

  final Product product;
  final AppLocalizations l10n;
  final String localeName;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final finishedLabel = DateFormat.yMMMd(localeName).format(product.updatedAt);

    return AppCard(
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
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.archiveFinishedOnLabel(finishedLabel),
            style: textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
