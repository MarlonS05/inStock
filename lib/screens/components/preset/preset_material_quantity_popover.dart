import 'package:flutter/material.dart';
import 'package:instock/l10n/app_localizations.dart';
import 'package:instock/theme/app_theme.dart';

Future<void> showPresetMaterialQuantityPopover({
  required BuildContext context,
  required GlobalKey anchorKey,
  required String materialTitle,
  required double quantity,
  required ValueChanged<double> onQuantityChanged,
}) async {
  final renderBox =
      anchorKey.currentContext?.findRenderObject() as RenderBox?;
  if (renderBox == null || !context.mounted) {
    return;
  }

  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final anchor = renderBox.localToGlobal(Offset.zero, ancestor: overlay);
  final anchorSize = renderBox.size;
  final l10n = AppLocalizations.of(context);

  await showMenu<void>(
    context: context,
    position: RelativeRect.fromLTRB(
      anchor.dx,
      anchor.dy + anchorSize.height + AppSpacing.xs,
      overlay.size.width - anchor.dx - anchorSize.width,
      overlay.size.height - anchor.dy - anchorSize.height,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    ),
    items: [
      PopupMenuItem<void>(
        enabled: false,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: _QuantityPopoverContent(
          materialTitle: materialTitle,
          initialQuantity: quantity,
          decrementLabel: l10n.productsMaterialQuantityDecrease,
          incrementLabel: l10n.productsMaterialQuantityIncrease,
          onQuantityChanged: onQuantityChanged,
        ),
      ),
    ],
  );
}

class _QuantityPopoverContent extends StatefulWidget {
  const _QuantityPopoverContent({
    required this.materialTitle,
    required this.initialQuantity,
    required this.decrementLabel,
    required this.incrementLabel,
    required this.onQuantityChanged,
  });

  final String materialTitle;
  final double initialQuantity;
  final String decrementLabel;
  final String incrementLabel;
  final ValueChanged<double> onQuantityChanged;

  @override
  State<_QuantityPopoverContent> createState() =>
      _QuantityPopoverContentState();
}

class _QuantityPopoverContentState extends State<_QuantityPopoverContent> {
  late double _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _updateQuantity(double next) {
    setState(() => _quantity = next);
    widget.onQuantityChanged(next);
    if (next <= 0 && mounted) {
      // Local popover dismiss only — route-level nav is BLoC-owned.
      Navigator.of(context).pop();
    }
  }

  String _displayQuantity(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    final text = value.toString();
    return text.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 220,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.materialTitle,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filledTonal(
                onPressed: () => _updateQuantity(_quantity - 1),
                tooltip: widget.decrementLabel,
                icon: const Icon(Icons.remove_rounded),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text(
                  _displayQuantity(_quantity),
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: scheme.primary,
                  ),
                ),
              ),
              IconButton.filledTonal(
                onPressed: () => _updateQuantity(_quantity + 1),
                tooltip: widget.incrementLabel,
                icon: const Icon(Icons.add_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
