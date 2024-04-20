import 'package:flutter/material.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/font_size.dart';
import 'package:togodo/gen/fonts.gen.dart';

class AppTextTheme {
  factory AppTextTheme() {
    const normalRegular = TextStyle(
      fontWeight: FontWeight.w400,
      height: 1.5,
      leadingDistribution: TextLeadingDistribution.even,
      fontFamily: FontFamily.dMSans,
      letterSpacing: 0.2,
    );

    return AppTextTheme._(
      h1: const TextStyle(fontSize: FontSize.heading1).merge(normalRegular),
      h2: const TextStyle(fontSize: FontSize.heading2).merge(normalRegular),
      h3: const TextStyle(fontSize: FontSize.heading3).merge(normalRegular),
      h4: const TextStyle(fontSize: FontSize.heading4).merge(normalRegular),
      h5: const TextStyle(fontSize: FontSize.heading5).merge(normalRegular),
      h6: const TextStyle(fontSize: FontSize.heading6).merge(normalRegular),
      bodyXLarge:
          const TextStyle(fontSize: FontSize.bodyXLarge).merge(normalRegular),
      bodyLarge:
          const TextStyle(fontSize: FontSize.bodyLarge).merge(normalRegular),
      bodyMedium:
          const TextStyle(fontSize: FontSize.bodyMedium).merge(normalRegular),
      bodySmall:
          const TextStyle(fontSize: FontSize.bodySmall).merge(normalRegular),
      bodyXSmall:
          const TextStyle(fontSize: FontSize.bodyXSmall).merge(normalRegular),
    );
  }

  const AppTextTheme._({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.bodyXLarge,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.bodyXSmall,
  });

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle h6;
  final TextStyle bodyXLarge;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle bodyXSmall;
}

extension TextStyleExt on TextStyle {
  TextStyle bold() => copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle comfort() => copyWith(height: 1.8);

  TextStyle dense() => copyWith(height: 1.2);

  TextStyle dmSans() => copyWith(fontFamily: FontFamily.dMSans);
  TextStyle colorGrey() => copyWith(color: MainColors.grey50);
}
