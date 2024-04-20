import 'package:flutter/material.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

// Color converter: https://www.w3schools.com/colors/colors_converter.asp
// Transparency list
// 100% FF
// 95%  F2
// 90%  E6
// 87%  DE
// 85%  D9
// 80%  CC
// 75%  BF
// 70%  B3
// 65%  A6
// 60%  99
// 55%  8C
// 54%  8A
// 50%  80
// 45%  73
// 40%  66
// 35%  59
// 32%  52
// 30%  4D
// 26%  42
// 25%  40
// 20%  33
// 16%  29
// 15%  26
// 12%  1F
// 10%  1A
// 5%   0D

class AppColors {
  const AppColors({
    required this.background,
    required this.themeColor,
    required this.disabled,
    required this.error,
    required this.divider,
    required this.text,
    required this.secondText,
  });

  factory AppColors.light() {
    return const AppColors(
      background: MainColors.white,
      themeColor: MainColors.primary,
      disabled: MainColors.disabled,
      error: MainColors.error,
      divider: MainColors.grey200,
      text: MainColors.dark1,
      secondText: MainColors.grey500,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      background: MainColors.dark1,
      themeColor: MainColors.primary,
      disabled: MainColors.disabled,
      error: MainColors.error,
      divider: MainColors.dark3,
      text: MainColors.white,
      secondText: MainColors.grey500,
    );
  }

  final Color background;
  final Color themeColor;
  final Color disabled;
  final Color error;
  final Color divider;
  final Color text;
  final Color secondText;
}
