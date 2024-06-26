import 'package:cimawy/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem BottomNavBarItem(
    {required int index,
    required int currentIndex,
    required String iconPath,
    required String label}) {
  return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        color: currentIndex == index
            ? AppColors.primaryColor
            : AppColors.whiteColor,
      ),
      label: label);
}
