import 'package:flutter/material.dart';

extension DeviceSize on BuildContext {
  // iPhone SE gibi küçük ekranlı cihazlar için kontrol
  bool get isSmallScrn {
    final deviceWidth = MediaQuery.of(this).size.shortestSide;
    return deviceWidth < 400; // dp cinsinden genişlik değeri
  }

  // iPhone 12 Pro gibi orta ekranlı cihazlar için kontrol
  bool get isMediumScrn {
    final deviceWidth = MediaQuery.of(this).size.shortestSide;
    return deviceWidth >= 400 &&
        deviceWidth < 900; // dp cinsinden genişlik değeri
  }

  static double referenceScreenWidth = 430;
  static double referenceScreenHeight = 932;

  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  double dyWidth(double val) => (width * val) / referenceScreenWidth;

  double dyHeight(double val) => (height * val) / referenceScreenHeight;
}
