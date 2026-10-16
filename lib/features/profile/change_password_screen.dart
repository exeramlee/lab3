import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';

/// Зміна пароля (ФВ-13).
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  void _changePassword(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Пароль змінено')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Зміна пароля')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.formHorizontal,
            AppSpacing.medium,
            AppSpacing.formHorizontal,
            AppSpacing.large,
          ),
          children: [
            const AppTextField(
              label: 'Поточний пароль',
              initialValue: 'Secret1234',
              isPassword: true,
              showPasswordToggle: true,
            ),
            const SizedBox(height: AppSpacing.large),
            const AppTextField(
              label: 'Новий пароль',
              initialValue: 'NewSecret2026',
              isPassword: true,
              showPasswordToggle: true,
            ),
            const SizedBox(height: AppSpacing.large),
            const AppTextField(
              label: 'Повторіть новий пароль',
              initialValue: 'NewSecret2026',
              isPassword: true,
              showPasswordToggle: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: AppSpacing.xLarge),
            PrimaryButton(
              label: 'Змінити пароль',
              onPressed: () => _changePassword(context),
            ),
          ],
        ),
      ),
    );
  }
}
