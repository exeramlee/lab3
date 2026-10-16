import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';
import '../main/main_shell.dart';
import 'register_screen.dart';
import 'reset_password_screen.dart';

/// Екран входу в акаунт (ФВ-2). Кнопка «Увійти» без перевірки даних
/// відкриває головний екран, як у випадку успішної авторизації.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _login(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (context) => const MainShell()),
    );
  }

  void _openRegister(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) => const RegisterScreen()),
    );
  }

  void _openResetPassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const ResetPasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.formHorizontal,
                  0,
                  AppSpacing.formHorizontal,
                  40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 64),
                    const Text(
                      'Гарантія',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        height: 40 / 32,
                        fontWeight: FontWeight.w500,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.small),
                    const Text(
                      'Облік покупок і гарантій',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 24 / 16,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxLarge),
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
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: AppSpacing.small),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => _openResetPassword(context),
                        child: const Text('Забули пароль?'),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.small),
                    PrimaryButton(
                      label: 'Увійти',
                      onPressed: () => _login(context),
                    ),
                    const Spacer(),
                    const SizedBox(height: AppSpacing.large),
                    SecondaryButton(
                      label: 'Створити акаунт',
                      onPressed: () => _openRegister(context),
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
