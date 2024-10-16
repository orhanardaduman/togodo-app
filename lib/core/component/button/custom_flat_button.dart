import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    required this.onPressed,
    required this.label,
    super.key,
    this.isLoading,
    this.color,
    this.labelStyle,
    this.isWraped = false,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  });
  final void Function()? onPressed;
  final String label;
  final TextStyle? labelStyle;
  final ValueNotifier<bool>? isLoading;
  final bool isWraped;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isWraped ? null : double.infinity,
      child: ValueListenableBuilder<bool>(
        valueListenable: isLoading ?? ValueNotifier(false),
        builder: (context, loading, child) {
          return ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(padding),
              backgroundColor: MaterialStateProperty.all(
                loading
                    ? Theme.of(context).disabledColor
                    : color ?? Theme.of(context).primaryColor,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              overlayColor: MaterialStateProperty.all(
                color ?? Theme.of(context).primaryColorDark,
              ),
              foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onPressed: loading ? null : onPressed,
            child: loading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: FittedBox(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          color ?? Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  )
                : child!,
          );
        },
        child: Text(
          label,
          style: labelStyle,
          /* GoogleFonts.mulish(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onPrimary,
              ), */
        ),
      ),
    );
  }
}
