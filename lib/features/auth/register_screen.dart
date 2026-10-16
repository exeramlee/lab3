import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';
import '../main/main_shell.dart';

/// Екран реєстрації (ФВ-1).
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  void _register(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (context) => const MainShell()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Створити акаунт')),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.formHorizontal,
                  AppSpacing.small,
                  AppSpacing.formHorizontal,
                  AppSpacing.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Зареєструйтесь, щоб зберігати чеки та гарантії й мати '
                      'до них доступ з усіх своїх пристроїв.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 20 / 14,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.large),
                    AppTextField(
                      label: "Ім'я та прізвище",
                      initialValue: MockData.userFullName,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: AppSpacing.large),
                    const AppTextField(
                      label: 'Email',
                      initialValue: MockData.userEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: AppSpacing.large),
                    const AppTextField(
                      label: 'Пароль',
                      initialValue: 'Secret1234',
                      isPassword: true,
                      showPasswordToggle: true,
                      helperText: 'Щонайменше 8 символів, літери та цифри',
                    ),
                    const SizedBox(height: AppSpacing.large),
                    const AppTextField(
                      label: 'Повторіть пароль',
                      initialValue: 'Secret1234',
                      isPassword: true,
                      showPasswordToggle: true,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: AppSpacing.xLarge),
                    PrimaryButton(
                      label: 'Зареєструватися',
                      onPressed: () => _register(context),
                    ),
                    const Spacer(),
                    const SizedBox(height: AppSpacing.large),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Вже маєте акаунт?',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Увійти'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
