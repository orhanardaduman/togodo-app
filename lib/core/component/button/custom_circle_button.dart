// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    required this.backgroundColor,
    this.iconColor = Colors.white,
    this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(100)),
    this.side = BorderSide.none,
    this.mini = false,
    this.iconPath,
    super.key,
  });
  final Color backgroundColor;
  final Color? iconColor;
  final void Function()? onPressed;
  final BorderRadiusGeometry borderRadius;
  final BorderSide side;
  final String? iconPath;
  final bool mini;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: key,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: side,
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      mini: mini,
      onPressed: onPressed,
      child: iconPath != null
          ? SvgPicture.asset(
              iconPath!,
              color: iconColor,
              width: 20,
              height: 20,
            )
          : Icon(
              Icons.add,
              size: 35,
              color: iconColor,
            ),
    );
  }
}
