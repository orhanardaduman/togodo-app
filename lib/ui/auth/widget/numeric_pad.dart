import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';

class NumericPad extends StatelessWidget {
  const NumericPad({
    required this.onNumberSelected,
    required this.theme,
    this.isDark = false,
    super.key,
  });

  final void Function(int) onNumberSelected;
  final AppTheme theme;
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    final dynamicHeight = context.sized.dynamicHeight(0.1);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: isDark ? MainColors.dark2 : MainColors.grey50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: dynamicHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(1),
                buildNumber(2),
                buildNumber(3),
              ],
            ),
          ),
          SizedBox(
            height: dynamicHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(4),
                buildNumber(5),
                buildNumber(6),
              ],
            ),
          ),
          SizedBox(
            height: dynamicHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(7),
                buildNumber(8),
                buildNumber(9),
              ],
            ),
          ),
          SizedBox(
            height: dynamicHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildEmptySpace(),
                buildNumber(0),
                buildBackspace(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNumber(int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(number);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isDark ? MainColors.dark2 : MainColors.grey50,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: PrimaryText(
                number.toString(),
                style: theme.textTheme.h4.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackspace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isDark ? MainColors.dark2 : MainColors.grey50,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.backspace_outlined,
                size: 28,
                color: theme.appColors.text,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmptySpace() {
    return Expanded(
      child: Container(),
    );
  }
}
