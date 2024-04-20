import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomLoader {
  factory CustomLoader() {
    if (_customLoader != null) {
      return _customLoader!;
    } else {
      _customLoader = CustomLoader._createObject();
      return _customLoader!;
    }
  }

  CustomLoader._createObject();
  static CustomLoader? _customLoader;

  //static OverlayEntry _overlayEntry;
  late OverlayState? _overlayState; //= new OverlayState();
  OverlayEntry? _overlayEntry;

  void _buildLoader() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return SizedBox(
          height: context.sized.height,
          width: context.sized.width,
          child: buildLoader(context),
        );
      },
    );
  }

  void showLoader(BuildContext context) {
    _overlayState = Overlay.of(context);
    _buildLoader();
    _overlayState!.insert(_overlayEntry!);
  }

  void hideLoader() {
    try {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } catch (e) {
      log('Exception:: $e');
    }
  }

  CustomScreenLoader buildLoader(
    BuildContext context, {
    Color? backgroundColor,
  }) {
    backgroundColor ??= const Color(0xffa8a8a8).withOpacity(.5);
    const height = 150.0;
    return CustomScreenLoader(
      height: height,
      width: height,
      backgroundColor: backgroundColor,
    );
  }
}

class CustomScreenLoader extends StatelessWidget {
  const CustomScreenLoader({
    super.key,
    this.backgroundColor = const Color(0xfff8f8f8),
    this.height = 30,
    this.width = 30,
  });
  final Color backgroundColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Container(
        height: height,
        width: height,
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(50),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              if (Platform.isIOS)
                const CupertinoActivityIndicator(
                  radius: 35,
                )
              else
                const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              Image.asset(
                'assets/images/real.png',
                height: 30,
                width: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
