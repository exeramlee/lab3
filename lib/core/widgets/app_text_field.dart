import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Стилізоване поле введення з макетів: outlined-рамка, мітка над полем,
/// опційна кнопка показу пароля або іконка-замок для полів лише для читання.
class AppTextField extends StatefulWidget {
  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final String? helperText;
  final bool isPassword;
  final bool showPasswordToggle;
  final bool readOnly;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.controller,
    this.helperText,
    this.isPassword = false,
    this.showPasswordToggle = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    final textColor =
        widget.readOnly ? AppColors.onSurfaceVariant : AppColors.onSurface;

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.controller == null ? widget.initialValue : null,
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.maxLines > 1 ? widget.maxLines : null,
      keyboardType: widget.isPassword
          ? TextInputType.visiblePassword
          : widget.keyboardType,
      textInputAction: widget.maxLines > 1
          ? TextInputAction.newline
          : widget.textInputAction,
      onChanged: widget.onChanged,
      style: TextStyle(fontSize: 16, color: textColor),
      decoration: InputDecoration(
        labelText: widget.label,
        helperText: widget.helperText,
        alignLabelWithHint: widget.maxLines > 1,
        enabledBorder: widget.readOnly
            ? Theme.of(context).inputDecorationTheme.disabledBorder
            : null,
        focusedBorder: widget.readOnly
            ? Theme.of(context).inputDecorationTheme.disabledBorder
            : null,
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.readOnly) {
      return const Icon(Icons.lock, color: AppColors.onSurfaceVariant);
    }
    if (widget.isPassword && widget.showPasswordToggle) {
      return IconButton(
        tooltip: _obscureText ? 'Показати пароль' : 'Сховати пароль',
        color: AppColors.onSurfaceVariant,
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: _toggleVisibility,
      );
    }
    return null;
  }
}
