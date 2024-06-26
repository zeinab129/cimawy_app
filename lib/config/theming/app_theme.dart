import 'package:cimawy/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.bgColor,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 24,
      )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottomNavBarBgColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.whiteColor.withOpacity(0.75),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
      ));
}
