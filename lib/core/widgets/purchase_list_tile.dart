import 'package:flutter/material.dart';

import '../models/purchase.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Колір підпису стану гарантії: діє / спливає / закінчилась.
extension WarrantyStatusColor on WarrantyStatus {
  Color get color => switch (this) {
        WarrantyStatus.active => AppColors.primary,
        WarrantyStatus.expiring => AppColors.warning,
        WarrantyStatus.expired => AppColors.error,
      };

  String get label => switch (this) {
        WarrantyStatus.active => 'Діє',
        WarrantyStatus.expiring => 'Спливає',
        WarrantyStatus.expired => 'Закінчилась',
      };
}

/// Рядок списку покупок / гарантій: назва, підзаголовок і кольоровий статус
/// праворуч. Використовується на головному екрані, у покупках і гарантіях.
class PurchaseListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final Color trailingColor;
  final VoidCallback? onTap;

  const PurchaseListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.trailingColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 88),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.medium,
          vertical: AppSpacing.small,
        ),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.outlineVariant)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 24 / 16,
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 20 / 14,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              trailing,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: trailingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
