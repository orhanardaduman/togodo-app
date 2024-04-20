import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/widgets/flat_chat_item.dart';

class FlatPageHeader extends HookConsumerWidget {
  const FlatPageHeader({
    super.key,
    this.title,
    this.backgroundColor,
    this.suffixWidget,
    this.prefixWidget,
    this.isWriting,
  });
  final String? title;
  final Color? backgroundColor;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final bool? isWriting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    double paddingRight() {
      if (suffixWidget == null) {
        return 24;
      } else {
        return 16;
      }
    }

    double paddingLeft() {
      if (prefixWidget == null) {
        return 24;
      } else {
        return 16;
      }
    }

    double headerPadding() {
      if (prefixWidget == null) {
        return 0;
      } else {
        return 8;
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 60,
        left: paddingLeft(),
        right: paddingRight(),
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixWidget ?? Container(),
              const SizedBox(
                width: 16,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: headerPadding(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      title ?? 'Header',
                      style: theme.textTheme.h4.copyWith(
                        color: theme.appColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isWriting ?? false) const AnimatedDotProgress(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: suffixWidget,
          ),
        ],
      ),
    );
  }
}
