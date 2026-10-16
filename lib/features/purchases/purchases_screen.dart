import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/models/purchase.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';
import 'add_purchase_screen.dart';
import 'purchase_details_screen.dart';

enum _PurchaseFilter { all, active, expiring, expired }

/// Список покупок із пошуком і фільтрами (ФВ-5).
/// Пошук і фільтр працюють лише над локальним (hardcoded) списком.
class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  static const Map<_PurchaseFilter, String> _filterLabels = {
    _PurchaseFilter.all: 'Усі',
    _PurchaseFilter.active: 'Діють',
    _PurchaseFilter.expiring: 'Спливають',
    _PurchaseFilter.expired: 'Закінчились',
  };

  _PurchaseFilter _filter = _PurchaseFilter.all;
  String _query = '';

  List<Purchase> get _visiblePurchases {
    final query = _query.toLowerCase();
    return MockData.purchases.where((purchase) {
      final matchesFilter = switch (_filter) {
        _PurchaseFilter.all => true,
        _PurchaseFilter.active => purchase.status == WarrantyStatus.active,
        _PurchaseFilter.expiring => purchase.status == WarrantyStatus.expiring,
        _PurchaseFilter.expired => purchase.status == WarrantyStatus.expired,
      };
      final matchesQuery = query.isEmpty ||
          purchase.name.toLowerCase().contains(query) ||
          purchase.store.toLowerCase().contains(query);
      return matchesFilter && matchesQuery;
    }).toList();
  }

  void _openAddPurchase() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) => const AddPurchaseScreen()),
    );
  }

  void _openDetails(Purchase purchase) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => PurchaseDetailsScreen(purchase: purchase),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final purchases = _visiblePurchases;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ScreenTitle('Мої покупки'),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.medium,
              ),
              child: _buildSearchField(),
            ),
            const SizedBox(height: AppSpacing.medium),
            _buildFilters(),
            const SizedBox(height: AppSpacing.xSmall),
            Expanded(
              child: purchases.isEmpty
                  ? const Center(
                      child: Text(
                        'Нічого не знайдено',
                        style: TextStyle(color: AppColors.onSurfaceVariant),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 88),
                      itemCount: purchases.length,
                      itemBuilder: (context, index) {
                        final purchase = purchases[index];
                        return PurchaseListTile(
                          title: purchase.name,
                          subtitle: '${purchase.store} · '
                              '${purchase.purchaseDate} · ${purchase.price}',
                          trailing: purchase.status.label,
                          trailingColor: purchase.status.color,
                          onTap: () => _openDetails(purchase),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Додати покупку',
        onPressed: _openAddPurchase,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      onChanged: (value) => setState(() => _query = value.trim()),
      textInputAction: TextInputAction.search,
      style: const TextStyle(fontSize: 16, color: AppColors.onSurface),
      decoration: InputDecoration(
        hintText: 'Пошук',
        hintStyle: const TextStyle(color: AppColors.onSurfaceVariant),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: AppSpacing.small),
          child: Icon(Icons.search, color: AppColors.onSurfaceVariant),
        ),
        filled: true,
        fillColor: AppColors.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: _searchBorder,
        enabledBorder: _searchBorder,
        focusedBorder: _searchBorder,
      ),
    );
  }

  static final OutlineInputBorder _searchBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide.none,
  );

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
      child: Row(
        children: [
          for (final entry in _filterLabels.entries) ...[
            ChoiceChip(
              label: Text(entry.value),
              selected: _filter == entry.key,
              showCheckmark: false,
              selectedColor: AppColors.secondaryContainer,
              backgroundColor: AppColors.surface,
              side: BorderSide(
                color: _filter == entry.key
                    ? Colors.transparent
                    : AppColors.outlineVariant,
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: _filter == entry.key
                    ? AppColors.onSecondaryContainer
                    : AppColors.onSurfaceVariant,
              ),
              onSelected: (_) => setState(() => _filter = entry.key),
            ),
            const SizedBox(width: AppSpacing.small),
          ],
        ],
      ),
    );
  }
}
