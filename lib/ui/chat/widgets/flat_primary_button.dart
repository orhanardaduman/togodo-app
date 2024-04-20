import 'package:flutter/material.dart';

class FlatPrimaryButton extends StatelessWidget {
  const FlatPrimaryButton({
    super.key,
    this.color,
    this.backgroundColor,
    this.contentSize,
    this.textSize,
    this.text,
    this.onPressed,
    this.enabled,
    this.textAlign,
    this.prefixIcon,
    this.suffixIcon,
  });
  final Color? backgroundColor;
  final String? text;
  final Color? color;
  final double? contentSize;
  final double? textSize;
  final void Function()? onPressed;
  final bool? enabled;
  final TextAlign? textAlign;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    void Function()? btnOnPressed() {
      if (enabled != null && enabled == false) {
        return null;
      } else {
        return onPressed;
      }
    }

    Widget prefixIconWidget() {
      if (prefixIcon != null) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: Icon(
            prefixIcon,
            color: color ?? Colors.white,
            size: contentSize ?? 20.0,
          ),
        );
      } else {
        return Container();
      }
    }

    Widget suffixIconWidget() {
      if (suffixIcon != null) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          child: Icon(
            suffixIcon,
            color: color ?? Colors.white,
            size: contentSize ?? 20.0,
          ),
        );
      } else {
        return Container();
      }
    }

    return GestureDetector(
      onTap: btnOnPressed(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(
          16,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefixIconWidget(),
            Expanded(
              child: Text(
                text ?? 'Primary Button',
                style: TextStyle(
                  color: color ?? Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: textSize ?? 16.0,
                ),
                textAlign: textAlign ?? TextAlign.center,
              ),
            ),
            suffixIconWidget(),
          ],
        ),
      ),
    );
  }
}
