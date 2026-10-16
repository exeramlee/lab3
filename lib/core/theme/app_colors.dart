import 'package:flutter/material.dart';

/// Кольори застосунку з макетів (Material Design 3, базовий колір #006A6B).
abstract final class AppColors {
  static const Color primary = Color(0xFF006A6B);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFB8EDEC);
  static const Color onPrimaryContainer = Color(0xFF002020);
  static const Color secondaryContainer = Color(0xFFCCE8E7);
  static const Color onSecondaryContainer = Color(0xFF051F1F);

  static const Color surface = Color(0xFFF4FAFA);
  static const Color onSurface = Color(0xFF161D1D);
  static const Color onSurfaceVariant = Color(0xFF3F4948);
  static const Color surfaceContainer = Color(0xFFE8EFEE);
  static const Color surfaceContainerHighest = Color(0xFFE3E9E8);

  static const Color outline = Color(0xFF6F7979);
  static const Color outlineVariant = Color(0xFFBEC9C8);

  static const Color error = Color(0xFFBA1A1A);

  /// Колір для гарантій, що скоро закінчуються.
  static const Color warning = Color(0xFF8A5000);
}
