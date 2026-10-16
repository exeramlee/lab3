import 'package:flutter/material.dart';

import '../../core/models/purchase.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';

/// Форма додавання (ФВ-6) і редагування (ФВ-8) покупки.
/// Якщо передано [purchase] – форма відкривається в режимі редагування.
class AddPurchaseScreen extends StatelessWidget {
  final Purchase? purchase;

  const AddPurchaseScreen({super.key, this.purchase});

  bool get _isEditing => purchase != null;

  void _save(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isEditing ? 'Зміни збережено' : 'Покупку додано'),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final item = purchase;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Редагування' : 'Нова покупка'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.formHorizontal,
                  AppSpacing.small,
                  AppSpacing.formHorizontal,
                  AppSpacing.medium,
                ),
                children: [
                  AppTextField(
                    label: 'Назва товару',
                    initialValue:
                        item?.name ?? "Кавомашина De'Longhi Magnifica S",
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    label: 'Магазин',
                    initialValue: item?.store ?? 'Comfy',
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    label: 'Дата покупки',
                    initialValue: item?.purchaseDate ?? '01.10.2026',
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    label: 'Ціна, ₴',
                    initialValue:
                        item?.price.replaceAll(' ₴', '') ?? '15 499',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    label: 'Гарантія, місяців',
                    initialValue: '${item?.warrantyMonths ?? 24}',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    label: 'Нотатки',
                    initialValue: item?.notes ?? '',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Фото чека',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.small),
                  SecondaryButton(
                    label: 'Додати фото',
                    icon: Icons.photo_camera,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.formHorizontal,
                12,
                AppSpacing.formHorizontal,
                AppSpacing.large,
              ),
              child: PrimaryButton(
                label: 'Зберегти',
                onPressed: () => _save(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
