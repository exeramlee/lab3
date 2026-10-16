import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';

/// Екран відновлення пароля через електронну пошту (ФВ-3).
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  void _sendLink(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Посилання для відновлення надіслано на email'),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Відновлення пароля')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.formHorizontal,
            AppSpacing.small,
            AppSpacing.formHorizontal,
            AppSpacing.large,
          ),
          children: [
            const Text(
              'Введіть email, і ми надішлемо посилання для створення '
              'нового пароля.',
              style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.large),
            const AppTextField(
              label: 'Email',
              initialValue: MockData.userEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: AppSpacing.large),
            PrimaryButton(
              label: 'Надіслати посилання',
              onPressed: () => _sendLink(context),
            ),
          ],
        ),
      ),
    );
  }
}
