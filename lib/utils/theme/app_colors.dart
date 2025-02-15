// lib/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryLight = Color(0xFF64B5F6);
  static const Color primaryDark = Color(0xFF1976D2);

  // Secondary Colors
  static const Color secondary = Color(0xFF4CAF50);
  static const Color secondaryLight = Color(0xFF81C784);
  static const Color secondaryDark = Color(0xFF388E3C);

  // Neutral Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF616161);

  // Background Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFFAFAFA);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = grey;

  static const Color inputBackground = white;
  static const Color inputBorder = grey;
  static const Color inputFocused = primary;
  static const Color inputError = error;
  static const Color buttonColor = Color.fromARGB(255, 84, 102, 157);

  static const List<Color> primaryGradient = [
    primary,
    primaryLight,
  ];
}
