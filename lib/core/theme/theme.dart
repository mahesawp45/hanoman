import 'package:flutter/material.dart';
import 'package:hanoman/core/constants/colors.dart';

abstract class AppThemes {
  static ThemeData getTheme({bool? isDark}) {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        surfaceTintColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.black.withOpacity(0.5),
      ),
    );
  }
}
