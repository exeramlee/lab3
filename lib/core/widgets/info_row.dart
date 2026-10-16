import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Рядок «назва – значення» на екрані деталей покупки.
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 56),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.outlineVariant)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.medium),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: highlight ? FontWeight.w500 : FontWeight.w400,
              color: highlight ? AppColors.primary : AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
