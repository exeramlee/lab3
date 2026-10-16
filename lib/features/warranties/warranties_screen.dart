import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/models/purchase.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';
import '../purchases/purchase_details_screen.dart';

/// Гарантії та нагадування (ФВ-11).
class WarrantiesScreen extends StatefulWidget {
  const WarrantiesScreen({super.key});

  @override
  State<WarrantiesScreen> createState() => _WarrantiesScreenState();
}

class _WarrantiesScreenState extends State<WarrantiesScreen> {
  bool _remindersEnabled = true;

  void _openDetails(Purchase purchase) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => PurchaseDetailsScreen(purchase: purchase),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        children: [
          const ScreenTitle('Гарантії'),
          Container(
            constraints: const BoxConstraints(minHeight: 56),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.outlineVariant),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Нагадувати за 30 днів',
                    style: TextStyle(fontSize: 16, color: AppColors.onSurface),
                  ),
                ),
                Switch(
                  value: _remindersEnabled,
                  onChanged: (value) =>
                      setState(() => _remindersEnabled = value),
                ),
              ],
            ),
          ),
          for (final purchase in MockData.warranties)
            PurchaseListTile(
              title: purchase.name,
              subtitle: purchase.status == WarrantyStatus.expired
                  ? 'Закінчилась ${purchase.warrantyUntil}'
                  : 'До ${purchase.warrantyUntil}',
              trailing: purchase.remaining,
              trailingColor: purchase.status.color,
              onTap: () => _openDetails(purchase),
            ),
        ],
      ),
    );
  }
}
