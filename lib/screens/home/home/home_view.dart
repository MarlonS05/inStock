import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instock/domain/constants/home_quote_count.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/screens/components/app_surface.dart';
import 'package:instock/screens/errors/ui_error_codes.dart';
import 'package:instock/screens/home/home/home_bloc.dart';
import 'package:instock/screens/home/home/home_event.dart';
import 'package:instock/screens/home/home/home_state.dart';
import 'package:instock/screens/shell/app_shell/app_shell_bloc.dart';
import 'package:instock/screens/shell/app_shell/app_shell_state.dart';
import 'package:instock/theme/app_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage &&
              current.errorMessage == UiErrorCodes.databaseOpenFailure,
          listener: (context, state) async {
            final recoveryL10n = AppLocalizations.of(context);
            final action = await showDialog<_DatabaseRecoveryAction>(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => AlertDialog(
                title: Text(recoveryL10n.homeDatabaseErrorTitle),
                content: Text(recoveryL10n.homeDatabaseErrorMessage),
                actions: [
                  TextButton(
                    // Local dialog dismiss only — route-level nav is BLoC-owned.
                    onPressed: () => Navigator.of(
                      dialogContext,
                    ).pop(_DatabaseRecoveryAction.retry),
                    child: Text(recoveryL10n.homeDatabaseRetry),
                  ),
                  FilledButton(
                    // Local dialog dismiss only — route-level nav is BLoC-owned.
                    onPressed: () => Navigator.of(
                      dialogContext,
                    ).pop(_DatabaseRecoveryAction.wipe),
                    child: Text(recoveryL10n.homeDatabaseWipe),
                  ),
                ],
              ),
            );
            if (!context.mounted) {
              return;
            }
            if (action == _DatabaseRecoveryAction.retry) {
              context.read<HomeBloc>().add(const HomeDatabaseRetryRequested());
              return;
            }
            if (action == _DatabaseRecoveryAction.wipe) {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (dialogContext) {
                  final scheme = Theme.of(dialogContext).colorScheme;
                  return AlertDialog(
                    title: Text(recoveryL10n.homeDatabaseWipeConfirmTitle),
                    content: Text(recoveryL10n.homeDatabaseWipeConfirmMessage),
                    actions: [
                      TextButton(
                        // Local dialog dismiss only — route-level nav is BLoC-owned.
                        onPressed: () => Navigator.of(dialogContext).pop(false),
                        child: Text(recoveryL10n.homeDatabaseCancel),
                      ),
                      FilledButton(
                        // Local dialog dismiss only — route-level nav is BLoC-owned.
                        onPressed: () => Navigator.of(dialogContext).pop(true),
                        style: FilledButton.styleFrom(
                          backgroundColor: scheme.error,
                          foregroundColor: scheme.onError,
                        ),
                        child: Text(recoveryL10n.homeDatabaseWipeConfirmAction),
                      ),
                    ],
                  );
                },
              );
              if (confirmed == true && context.mounted) {
                context.read<HomeBloc>().add(const HomeDatabaseWipeRequested());
              } else if (context.mounted) {
                context.read<HomeBloc>().add(const HomeRefreshRequested());
              }
              return;
            }
            context.read<HomeBloc>().add(const HomeRefreshRequested());
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == HomeStatus.failure &&
              current.errorMessage != UiErrorCodes.databaseOpenFailure,
          listener: (context, state) {
            final message = switch (state.errorMessage) {
              UiErrorCodes.purchaseFailure => l10n.homeShoppingPurchaseFailure,
              _ => l10n.homeShoppingPurchaseFailure,
            };
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
        ),
        BlocListener<AppShellBloc, AppShellState>(
          listenWhen: (previous, current) =>
              previous.currentIndex != current.currentIndex &&
              current.currentIndex == 0,
          listener: (context, _) {
            context.read<HomeBloc>().add(const HomeRefreshRequested());
          },
        ),
      ],
      child: SafeArea(
        bottom: false,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final quote = l10n.homeQuoteAt(state.quoteIndex ?? 0);

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.xxl,
                AppSpacing.md,
                AppSpacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.status == HomeStatus.initial)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        child: Text(
                          l10n.homeLoading,
                          style: textTheme.bodyLarge?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    )
                  else ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        AppSpacing.md,
                        AppSpacing.lg,
                        AppSpacing.md,
                      ),
                      child: RainbowQuoteText(
                        text: quote,
                        style: textTheme.titleLarge?.copyWith(
                          fontSize: (textTheme.titleLarge?.fontSize ?? 22) + 8,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    ShoppingListSection(items: state.shoppingList, l10n: l10n),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// --- folded from rainbow_quote_text.dart ---

/// Quote text filled by a rainbow gradient (letters as cut-outs of the wash).
class RainbowQuoteText extends StatelessWidget {
  const RainbowQuoteText({super.key, required this.text, this.style});

  static const _rainbowColors = [
    Color(0xFFE53935),
    Color(0xFFFB8C00),
    Color(0xFFFDD835),
    Color(0xFF43A047),
    Color(0xFF1E88E5),
    Color(0xFF5E35B1),
    Color(0xFFD81B60),
  ];

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final resolved = (style ?? Theme.of(context).textTheme.titleLarge)
        ?.copyWith(color: Colors.white);

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _rainbowColors,
        ).createShader(bounds);
      },
      child: Text(text, style: resolved),
    );
  }
}

// --- folded from purchase_quantity_dialog.dart ---

/// Prompts for how much of [item] was bought, then adds it to on-hand stock.
Future<void> showPurchaseQuantityDialog(
  BuildContext context, {
  required ShoppingListItem item,
}) {
  final bloc = context.read<HomeBloc>();

  return showDialog<void>(
    context: context,
    builder: (dialogContext) => BlocProvider.value(
      value: bloc,
      child: _PurchaseQuantityDialog(item: item),
    ),
  );
}

class _PurchaseQuantityDialog extends StatefulWidget {
  const _PurchaseQuantityDialog({required this.item});

  final ShoppingListItem item;

  @override
  State<_PurchaseQuantityDialog> createState() =>
      _PurchaseQuantityDialogState();
}

class _PurchaseQuantityDialogState extends State<_PurchaseQuantityDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(l10n.homeShoppingPurchaseTitle(widget.item.material.title)),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _quantityController,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: InputDecoration(
            labelText: l10n.homeShoppingPurchaseQuantity,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.inventoryQuantityRequired;
            }
            final parsed = double.tryParse(value);
            if (parsed == null || parsed <= 0) {
              return l10n.inventoryQuantityInvalid;
            }
            return null;
          },
          onFieldSubmitted: (_) => _confirm(),
        ),
      ),
      actions: [
        TextButton(
          // Local dialog dismiss only — route-level nav is BLoC-owned.
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.inventoryCancel),
        ),
        FilledButton(
          onPressed: _confirm,
          child: Text(l10n.homeShoppingPurchaseConfirm),
        ),
      ],
    );
  }

  void _confirm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<HomeBloc>().add(
      HomeMaterialPurchased(
        materialId: widget.item.material.id,
        quantity: double.parse(_quantityController.text),
      ),
    );
    // Local dialog dismiss only — route-level nav is BLoC-owned.
    Navigator.of(context).pop();
  }
}

// --- folded from shopping_list_section.dart ---

class ShoppingListSection extends StatelessWidget {
  const ShoppingListSection({
    super.key,
    required this.items,
    required this.l10n,
  });

  final List<ShoppingListItem> items;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return AppSurface(
      radius: AppRadius.lg,
      elevation: AppElevationLevel.none,
      color: scheme.surface,
      border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.4)),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 20,
                color: scheme.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                l10n.homeShoppingListTitle,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              child: Text(
                l10n.homeShoppingListEmpty,
                style: textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: _ShoppingListRow(item: item, l10n: l10n),
              ),
            ),
        ],
      ),
    );
  }
}

class _ShoppingListRow extends StatelessWidget {
  const _ShoppingListRow({required this.item, required this.l10n});

  final ShoppingListItem item;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final material = item.material;

    return AppSurface(
      radius: AppRadius.md,
      elevation: AppElevationLevel.none,
      color: Color.alphaBlend(
        scheme.errorContainer.withValues(alpha: 0.25),
        scheme.surfaceContainerLow,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  material.title,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.homeShoppingInStockNeeded(
                    _formatQuantity(item.material.quantity),
                    _formatQuantity(
                      item.requiredQuantity - item.material.quantity,
                    ),
                  ),
                  style: textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
            tooltip: l10n.homeShoppingPurchaseTooltip,
            onPressed: () => showPurchaseQuantityDialog(context, item: item),
            icon: const Icon(Icons.shopping_bag_outlined),
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

// --- folded from home_quote_l10n.dart ---

extension HomeQuoteL10n on AppLocalizations {
  String homeQuoteAt(int index) {
    return switch (index % homeQuoteCount) {
      0 => homeQuote0Text,
      1 => homeQuote1Text,
      2 => homeQuote2Text,
      3 => homeQuote3Text,
      4 => homeQuote4Text,
      5 => homeQuote5Text,
      6 => homeQuote6Text,
      7 => homeQuote7Text,
      8 => homeQuote8Text,
      9 => homeQuote9Text,
      10 => homeQuote10Text,
      11 => homeQuote11Text,
      12 => homeQuote12Text,
      13 => homeQuote13Text,
      14 => homeQuote14Text,
      15 => homeQuote15Text,
      16 => homeQuote16Text,
      17 => homeQuote17Text,
      18 => homeQuote18Text,
      19 => homeQuote19Text,
      20 => homeQuote20Text,
      21 => homeQuote21Text,
      22 => homeQuote22Text,
      23 => homeQuote23Text,
      24 => homeQuote24Text,
      25 => homeQuote25Text,
      26 => homeQuote26Text,
      27 => homeQuote27Text,
      28 => homeQuote28Text,
      29 => homeQuote29Text,
      30 => homeQuote30Text,
      31 => homeQuote31Text,
      32 => homeQuote32Text,
      33 => homeQuote33Text,
      34 => homeQuote34Text,
      35 => homeQuote35Text,
      36 => homeQuote36Text,
      37 => homeQuote37Text,
      38 => homeQuote38Text,
      39 => homeQuote39Text,
      40 => homeQuote40Text,
      41 => homeQuote41Text,
      42 => homeQuote42Text,
      43 => homeQuote43Text,
      44 => homeQuote44Text,
      45 => homeQuote45Text,
      46 => homeQuote46Text,
      47 => homeQuote47Text,
      48 => homeQuote48Text,
      49 => homeQuote49Text,
      50 => homeQuote50Text,
      51 => homeQuote51Text,
      52 => homeQuote52Text,
      53 => homeQuote53Text,
      54 => homeQuote54Text,
      55 => homeQuote55Text,
      56 => homeQuote56Text,
      57 => homeQuote57Text,
      58 => homeQuote58Text,
      59 => homeQuote59Text,
      60 => homeQuote60Text,
      61 => homeQuote61Text,
      62 => homeQuote62Text,
      63 => homeQuote63Text,
      64 => homeQuote64Text,
      65 => homeQuote65Text,
      66 => homeQuote66Text,
      67 => homeQuote67Text,
      68 => homeQuote68Text,
      69 => homeQuote69Text,
      70 => homeQuote70Text,
      71 => homeQuote71Text,
      72 => homeQuote72Text,
      73 => homeQuote73Text,
      74 => homeQuote74Text,
      75 => homeQuote75Text,
      76 => homeQuote76Text,
      77 => homeQuote77Text,
      78 => homeQuote78Text,
      79 => homeQuote79Text,
      80 => homeQuote80Text,
      81 => homeQuote81Text,
      82 => homeQuote82Text,
      83 => homeQuote83Text,
      84 => homeQuote84Text,
      85 => homeQuote85Text,
      86 => homeQuote86Text,
      87 => homeQuote87Text,
      88 => homeQuote88Text,
      89 => homeQuote89Text,
      90 => homeQuote90Text,
      91 => homeQuote91Text,
      92 => homeQuote92Text,
      93 => homeQuote93Text,
      94 => homeQuote94Text,
      95 => homeQuote95Text,
      96 => homeQuote96Text,
      97 => homeQuote97Text,
      98 => homeQuote98Text,
      99 => homeQuote99Text,
      100 => homeQuote100Text,
      101 => homeQuote101Text,
      102 => homeQuote102Text,
      103 => homeQuote103Text,
      104 => homeQuote104Text,
      105 => homeQuote105Text,
      106 => homeQuote106Text,
      _ => homeQuote0Text,
    };
  }
}

enum _DatabaseRecoveryAction { retry, wipe }
