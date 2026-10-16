import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/login_screen.dart';

class WarrantyApp extends StatelessWidget {
  const WarrantyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Гарантія',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LoginScreen(),
    );
  }
}
