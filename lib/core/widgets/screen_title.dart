import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Великий заголовок вкладок нижньої навігації («Привіт, Дмитро», «Гарантії»…).
class ScreenTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const ScreenTitle(this.title, {super.key, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
