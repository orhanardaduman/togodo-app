import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';

class CustomCheckBox extends HookConsumerWidget {
  const CustomCheckBox({
    this.label,
    super.key,
    this.isVal = false,
    this.onTap,
    this.padding,
    this.isBgColor = true,
  });

  final String? label;
  final void Function()? onTap;
  final bool isVal;
  final EdgeInsetsGeometry? padding;
  final bool isBgColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final bgColors = isVal
        ? MainColors.transparentBlue
        : (theme.mode == ThemeMode.dark ? MainColors.dark2 : MainColors.white);
    final checkIconColor = isVal ? MainColors.white : Colors.transparent;

    return GestureDetector(
      onTap: onTap,
      child: label == null
          ? checkBox(checkIconColor)
          : AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Animasyon süresi
              width: context.sized.width,
              padding: padding ??
                  const EdgeInsets.symmetric(
                    horizontal: FormStyle.inputWidth,
                    vertical: FormStyle.inputHeightVertical,
                  ),
              decoration: isBgColor
                  ? BoxDecoration(
                      borderRadius: FormStyle.borderRadius,
                      color: bgColors,
                    )
                  : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  checkBox(checkIconColor),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: context.sized.width - 150,
                    child: PrimaryText(
                      label!,
                      style: !isVal
                          ? null
                          : theme.textTheme.bodyMedium.copyWith(
                              color: theme.appColors.text,
                              fontWeight: FontWeight.w700,
                            ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  AnimatedContainer checkBox(Color checkIconColor) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200), // Animasyon süresi
      width: 20, // Tik işareti genişliği
      height: 20, // Tik işareti yüksekliği
      decoration: BoxDecoration(
        color: isVal ? MainColors.primary : Colors.transparent,
        border: Border.all(
          color: isVal ? MainColors.primary : MainColors.grey500,
        ),
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: Icon(
        Icons.check,
        size: isVal ? 16 : 0, // Tik işareti boyutu
        color: checkIconColor,
      ),
    );
  }
}
