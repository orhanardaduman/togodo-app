import 'package:flutter/material.dart';

class GlowRemoveScrollBehaviour extends ScrollBehavior {
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}