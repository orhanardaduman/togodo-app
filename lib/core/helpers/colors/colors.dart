import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MainColors {
  // Primary

  static const Color primary = Color(0xff0ec696);
  static const Color primary400 = Color(0xff0fb78b);
  static const Color primary300 = Color(0xff26d3a6);
  static const Color primary200 = Color(0xff55e7c0);
  static const Color primary100 = Color(0xffebf8f4);
  static const Color secondary = Color(0xff79408c);
  //New Colors
  static const Color chatColor = Color(0xff909093);
  // Alert & Status
  static const Color success = Color(0xff07bd74);
  static const Color info = Color(0xff246bfd);
  static const Color warning = Color(0xfffacc15);
  static const Color error = Color(0xfff75555);
  static const Color disabled = Color(0xffd8d8d8);
  static const Color disabledButton = Color(0xffd9d9d9);
  static const Color shadowText = Color(0xff0D0D0D);

  // Greyscale
  static const Color grey900 = Color(0xff212121);
  static const Color grey800 = Color(0xff424242);
  static const Color grey700 = Color(0xff616161);
  static const Color grey600 = Color(0xff757575);
  static const Color grey500 = Color(0xff9e9e9e);
  static const Color grey400 = Color(0xffbdbdbd);
  static const Color grey300 = Color(0xffe0e0e0);
  static const Color grey200 = Color(0xffeeeeee);
  static const Color grey100 = Color(0xfff5f5f5);
  static const Color grey50 = Color(0xfffafafa);
  static const Color bottomColor = Color(0xff181A20);
  static const Color textColor = Color(0xffBDBDBD);

  // Gradients

  static LinearGradient gradientBlue =
      createCustomGradient([const Color(0xff1cedbe), const Color(0xff249b87)]);
  static LinearGradient gradientYellow =
      createCustomGradient([const Color(0xfffacc15), const Color(0xffffe580)]);
  static LinearGradient gradientGreen =
      createCustomGradient([const Color(0xff22bb9c), const Color(0xff35debc)]);
  static LinearGradient gradientOrange =
      createCustomGradient([const Color(0xfffb9400), const Color(0xffffab38)]);
  static LinearGradient gradientRed =
      createCustomGradient([const Color(0xffff4d67), const Color(0xffff8a9b)]);

  // Dark Colors
  static const Color dark1 = Color(0xFF181A20);
  static const Color dark2 = Color(0xFF1F222A);
  static const Color dark3 = Color(0xFF35383F);

  // Others
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xfff54336);
  static const Color pink = Color(0xffea1e61);
  static const Color purple = Color(0xff9d28ac);
  static const purpleSecondary600 = Color(0xff574efa);
  static const Color deepPurple = Color(0xff673ab3);
  static const Color indigo = Color(0xff3f51b2);
  static const Color blue = Color(0xff1a96f0);
  static const Color lightBlue = Color(0xff00a9f1);
  static const Color cyan = Color(0xff00bcd3);
  static const Color teal = Color(0xff009689);
  static const Color green = Color(0xff4aaf57);
  static const Color lightGreen = Color(0xff8bc255);
  static const Color lime = Color(0xffcddc4c);
  static const Color yellow = Color(0xffffeb4f);
  static const Color amber = Color(0xffffc02d);
  static const Color orange = Color(0xffff981f);
  static const Color deepOrange = Color(0xffff5726);
  static const Color brown = Color(0xff7a5548);
  static const Color blueGrey = Color(0xff607d8a);
  static const neutral700 = Color(0xffdae0e6);

  // Background
  static const Color backgroundBlue = Color(0xffeef4ff);
  static const Color backgroundGreen = Color(0xfff2fffc);
  static const Color backgroundOrange = Color(0xfffff8ed);
  static const Color backgroundPink = Color(0xfffff5f5);
  static const Color backgroundYellow = Color(0xfffffee0);
  static const Color backgroundPurple = Color(0xfffcf4ff);

  // Transparent
  static const Color transparentBlue = Color(0x1420c6a5);
  static const Color transparentOrange = Color(0x14ff9800);
  static const Color transparentYellow = Color(0x14facc15);
  static const Color transparentRed = Color(0x14f75555);
  static const Color transparentGreen = Color(0x144caf50);
  static const Color transparentPurple = Color(0x149c27b0);
  static const Color transparentCyan = Color(0x1400bcd4);
  static const myGradient = LinearGradient(
    colors: [
      Color(0xff272727),
      Color(0x00000000),
    ],
    stops: [0, 0.375],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const myGradientBottom = LinearGradient(
    colors: [
      Color(0xff272727),
      Color(0x00000000),
    ],
    stops: [0, 0.375],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static LinearGradient createCustomGradient(List<Color> colors) {
    return LinearGradient(
      stops: const [0, 1],
      begin: const Alignment(0.87, 0.48),
      end: const Alignment(-0.87, -0.48),
      colors: colors,
    );
  }
}
