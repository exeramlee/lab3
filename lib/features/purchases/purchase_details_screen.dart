import 'package:flutter/material.dart';

import '../../core/models/purchase.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';
import 'add_purchase_screen.dart';

/// Деталі покупки з фото чека (ФВ-7) і діалогом видалення (ФВ-9).
class PurchaseDetailsScreen extends StatelessWidget {
  final Purchase purchase;

  const PurchaseDetailsScreen({super.key, required this.purchase});

  void _openEdit(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => AddPurchaseScreen(purchase: purchase),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceContainerHighest,
        title: const Text('Видалити покупку?'),
        content: const Text('Покупку і фото чека буде видалено назавжди.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Скасувати'),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Видалити'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Покупка'),
        actions: [
          IconButton(
            tooltip: 'Редагувати',
            color: AppColors.onSurfaceVariant,
            icon: const Icon(Icons.edit),
            onPressed: () => _openEdit(context),
          ),
          IconButton(
            tooltip: 'Видалити',
            color: AppColors.onSurfaceVariant,
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDelete(context),
          ),
          const SizedBox(width: AppSpacing.xSmall),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.medium,
            AppSpacing.small,
            AppSpacing.medium,
            AppSpacing.large,
          ),
          children: [
            _ReceiptPlaceholder(onTap: () {}),
            const SizedBox(height: AppSpacing.medium),
            Text(
              purchase.name,
              style: const TextStyle(
                fontSize: 22,
                height: 28 / 22,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.medium),
            InfoRow(label: 'Магазин', value: purchase.store),
            InfoRow(label: 'Дата покупки', value: purchase.purchaseDate),
            InfoRow(label: 'Ціна', value: purchase.price),
            InfoRow(
              label: 'Гарантія',
              value: '${purchase.warrantyMonths} міс.',
            ),
            InfoRow(
              label: 'Діє до',
              value: purchase.warrantyUntil,
              highlight: true,
            ),
            InfoRow(
              label: 'Нотатки',
              value: purchase.notes.isEmpty ? '—' : purchase.notes,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReceiptPlaceholder extends StatelessWidget {
  final VoidCallback onTap;

  const _ReceiptPlaceholder({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: const SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, size: 40, color: AppColors.onSurfaceVariant),
              SizedBox(height: AppSpacing.small),
              Text(
                'Фото чека',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
