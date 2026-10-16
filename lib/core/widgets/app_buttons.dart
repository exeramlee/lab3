import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Основна кнопка підтвердження дії (заливка базовим кольором, форма «пігулка»).
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const PrimaryButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

/// Другорядна кнопка з рамкою. [isDestructive] фарбує текст і іконку
/// у колір помилки (наприклад, «Вийти з акаунта»).
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isDestructive;

  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = isDestructive
        ? OutlinedButton.styleFrom(foregroundColor: AppColors.error)
        : null;

    if (icon == null) {
      return OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: Text(label),
      );
    }
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: Icon(icon, size: 20),
      label: Text(label),
    );
  }
}
