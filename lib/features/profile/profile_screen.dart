import 'package:flutter/material.dart';

import '../../core/data/mock_data.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/widgets/widgets.dart';
import '../auth/login_screen.dart';
import 'change_password_screen.dart';

/// Профіль користувача (ФВ-12): дані профілю, зміна пароля, вихід.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _saveChanges(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Зміни збережено')),
    );
  }

  void _openChangePassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const ChangePasswordScreen(),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        children: [
          const ScreenTitle('Профіль', fontSize: 28),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.formHorizontal,
              AppSpacing.small,
              AppSpacing.formHorizontal,
              AppSpacing.large,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: _ProfileAvatar()),
                const SizedBox(height: AppSpacing.medium),
                Text(
                  MockData.userFullName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    height: 28 / 22,
                    color: AppColors.onSurface,
                  ),
                ),
                const Text(
                  MockData.userEmail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.xLarge),
                const AppTextField(
                  label: "Ім'я",
                  initialValue: MockData.userFirstName,
                ),
                const SizedBox(height: AppSpacing.large),
                const AppTextField(
                  label: 'Прізвище',
                  initialValue: MockData.userLastName,
                ),
                const SizedBox(height: AppSpacing.large),
                const AppTextField(
                  label: 'Email (змінити не можна)',
                  initialValue: MockData.userEmail,
                  readOnly: true,
                ),
                const SizedBox(height: AppSpacing.large),
                PrimaryButton(
                  label: 'Зберегти зміни',
                  onPressed: () => _saveChanges(context),
                ),
                const SizedBox(height: AppSpacing.medium),
                const Divider(),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xSmall,
                  ),
                  leading: const Icon(
                    Icons.lock,
                    color: AppColors.onSurfaceVariant,
                  ),
                  title: const Text(
                    'Змінити пароль',
                    style: TextStyle(fontSize: 16, color: AppColors.onSurface),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.onSurfaceVariant,
                  ),
                  onTap: () => _openChangePassword(context),
                ),
                const Divider(),
                const SizedBox(height: AppSpacing.medium),
                SecondaryButton(
                  label: 'Вийти з акаунта',
                  icon: Icons.logout,
                  isDestructive: true,
                  onPressed: () => _logout(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Аватар з ініціалами та кнопкою зміни фото профілю.
class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      height: 108,
      child: Stack(
        children: [
          Container(
            width: 96,
            height: 96,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Text(
              MockData.userInitials,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: AppColors.onPrimaryContainer,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Material(
              color: AppColors.primary,
              shape: const CircleBorder(
                side: BorderSide(color: AppColors.surface, width: 2),
              ),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: const SizedBox(
                  width: 44,
                  height: 44,
                  child: Icon(
                    Icons.photo_camera,
                    size: 20,
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
