import 'package:flutter/material.dart';

/// Read-only text that becomes a borderless field when tapped.
class PresetInlineEditableText extends StatefulWidget {
  const PresetInlineEditableText({
    super.key,
    required this.text,
    required this.onCommit,
    required this.style,
    this.placeholder,
    this.placeholderStyle,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.required = false,
    this.padding = EdgeInsets.zero,
    this.cursorColor,
  });

  final String text;
  final ValueChanged<String> onCommit;
  final TextStyle? style;
  final String? placeholder;
  final TextStyle? placeholderStyle;
  final int? maxLines;
  final TextAlign textAlign;
  final bool required;
  final EdgeInsetsGeometry padding;
  final Color? cursorColor;

  @override
  State<PresetInlineEditableText> createState() =>
      _PresetInlineEditableTextState();
}

class _PresetInlineEditableTextState extends State<PresetInlineEditableText> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  var _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(covariant PresetInlineEditableText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isEditing && oldWidget.text != widget.text) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus && _isEditing) {
      _commit();
    }
  }

  void _startEditing() {
    _controller.text = widget.text;
    setState(() => _isEditing = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      }
    });
  }

  void _commit() {
    final trimmed = _controller.text.trim();
    if (widget.required && trimmed.isEmpty) {
      _controller.text = widget.text;
      setState(() => _isEditing = false);
      _focusNode.unfocus();
      return;
    }

    if (trimmed != widget.text) {
      widget.onCommit(trimmed);
    }

    setState(() => _isEditing = false);
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    if (_isEditing) {
      return Focus(
        onFocusChange: (hasFocus) {
          if (!hasFocus && _isEditing) {
            _commit();
          }
        },
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: widget.style,
          maxLines: widget.maxLines,
          textAlign: widget.textAlign,
          cursorColor: widget.cursorColor,
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: widget.padding,
          ),
          onSubmitted: (_) => _commit(),
        ),
      );
    }

    final isEmpty = widget.text.isEmpty;
    final displayStyle =
        isEmpty ? (widget.placeholderStyle ?? widget.style) : widget.style;

    return GestureDetector(
      onTap: _startEditing,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: widget.padding,
        child: Text(
          isEmpty ? (widget.placeholder ?? '') : widget.text,
          style: displayStyle,
          maxLines: widget.maxLines,
          overflow:
              widget.maxLines == 1 ? TextOverflow.ellipsis : TextOverflow.visible,
          textAlign: widget.textAlign,
        ),
      ),
    );
  }
}
