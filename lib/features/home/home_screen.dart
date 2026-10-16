import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/models/purchase.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';
import '../purchases/add_purchase_screen.dart';
import '../purchases/purchase_details_screen.dart';

/// Головний екран (ФВ-4): привітання, зведення та швидкий доступ
/// до основних функцій.
class HomeScreen extends StatelessWidget {
  static const String _userName = MockData.userFirstName;

  final VoidCallback onOpenPurchases;
  final VoidCallback onOpenWarranties;

  const HomeScreen({
    super.key,
    required this.onOpenPurchases,
    required this.onOpenWarranties,
  });

  void _openAddPurchase(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) => const AddPurchaseScreen()),
    );
  }

  void _openDetails(BuildContext context, Purchase purchase) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => PurchaseDetailsScreen(purchase: purchase),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expiring = MockData.expiringSoon;

    return SafeArea(
      bottom: false,
      child: ListView(
        children: [
          const ScreenTitle('Привіт, $_userName'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SummaryCard(
                  title: '${expiring.length} гарантії скоро закінчуються',
                  subtitle: 'Усього покупок: ${MockData.purchases.length}',
                  onTap: onOpenWarranties,
                ),
                const SizedBox(height: AppSpacing.medium),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        label: 'Додати покупку',
                        onPressed: () => _openAddPurchase(context),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.small),
                    Expanded(
                      child: SecondaryButton(
                        label: 'Мої покупки',
                        onPressed: onOpenPurchases,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.large),
                const Text(
                  'Скоро закінчується',
                  style: TextStyle(
                    fontSize: 16,
                    height: 24 / 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: AppSpacing.small),
              ],
            ),
          ),
          for (final purchase in expiring)
            PurchaseListTile(
              title: purchase.name,
              subtitle: 'Гарантія до ${purchase.warrantyUntil}',
              trailing: purchase.remaining,
              trailingColor: purchase.status.color,
              onTap: () => _openDetails(context, purchase),
            ),
        ],
      ),
    );
  }
}
