// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class OpenModalButton extends HookConsumerWidget {
  const OpenModalButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return CustomButton(
      text: 'Open Modal',
      onPressed: () {
        showDialog<Dialog>(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: CustomModal(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Assets.images.other.modalCheck.svg(
                        color: theme.appColors.themeColor,
                      ),
                      Assets.icons.bold.tickSquare.svg(
                        color: MainColors.white,
                        width: 49.2,
                        height: 49.2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  PrimaryText(
                    'Modal Title',
                    style:
                        theme.textTheme.h4.copyWith(color: MainColors.primary),
                  ),
                  const SizedBox(height: 16),
                  const PrimaryText(
                    'Lorem ipsum dolor sit amet hua qui lori ipsum sit ghui amet poetry amet',
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Button',
                    onPressed: () {},
                    radius: 100,
                  ),
                  const SizedBox(height: 12),
                  const CustomButton(
                    text: 'Button',
                    radius: 100,
                  ),
                ],
              ),
            ),
          ),
        );
        /*  showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => const CustomModal(),
        ); */
      },
    );
  }
}

class CustomModal extends HookConsumerWidget {
  const CustomModal({
    super.key,
    this.child,
    this.title,
    this.isCloseDivider = false,
    this.padding,
    this.maxHeight,
    this.borderRadius,
    this.constraints,
  });
  final Widget? child;
  final String? title;
  final bool isCloseDivider;
  final double? maxHeight;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxConstraints? constraints;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ConstrainedBox(
        constraints: constraints ??
            BoxConstraints(
              maxHeight: maxHeight ?? context.sized.dynamicHeight(0.8),
              minWidth: context.sized.width,
            ),
        child: Container(
          width: 340,
          decoration: BoxDecoration(
            color: theme.appColors.background,
            borderRadius: borderRadius ??
                const BorderRadius.only(
                  topLeft: Radius.circular(52),
                  topRight: Radius.circular(52),
                ),
            border: Border.all(
              color: theme.mode == ThemeMode.dark
                  ? MainColors.dark2
                  : MainColors.grey100,
              width: 2,
            ),
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                // Rectangle

                if (isCloseDivider)
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 38,
                        height: 3,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          color: Color(0xffe0e0e0),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),

                if (title != null)
                  PrimaryText(
                    title!,
                    style: theme.textTheme.h4.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                Padding(
                  padding: padding ?? const EdgeInsets.all(24),
                  child: child ?? const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DragCustomModal extends HookConsumerWidget {
  const DragCustomModal({
    required this.controller,
    super.key,
    this.child,
    this.title,
    this.isCloseDivider = false,
    this.padding,
    this.borderRadius,
  });
  final Widget? child;
  final String? title;
  final bool isCloseDivider;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final ScrollController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Container(
      height: context.sized.dynamicHeight(0.9),
      width: context.sized.width,
      decoration: BoxDecoration(
        color: theme.appColors.background,
        borderRadius: borderRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(52),
              topRight: Radius.circular(52),
            ),
        border: Border.all(
          color: theme.mode == ThemeMode.dark
              ? MainColors.dark2
              : MainColors.grey100,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: ListView(
                padding: padding ??
                    const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 5,
                    ),
                controller: controller,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  child ?? const SizedBox(),
                ],
              ),
            ),
          ),
          if (isCloseDivider)
            IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.appColors.background,
                  borderRadius: borderRadius ??
                      const BorderRadius.only(
                        topLeft: Radius.circular(52),
                        topRight: Radius.circular(52),
                      ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: context.sized.dynamicWidth(0.9),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: 38,
                              height: 3,
                              margin: const EdgeInsets.only(top: 8, bottom: 20),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                color: Color(0xffe0e0e0),
                              ),
                            ),
                          ),
                          if (title != null)
                            PrimaryText(
                              title!,
                              maxLines: 1,
                              style: theme.textTheme.h4.copyWith(
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          Divider(
                            color: theme.appColors.divider,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
