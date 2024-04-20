// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class StackedWidgets extends HookConsumerWidget {
  const StackedWidgets({
    required this.joinedUsers,
    super.key,
    this.direction = TextDirection.ltr,
    this.size = 100,
    this.imageLength = 2,
    this.xShift = 20,
    this.isAddButton = false,
  });
  final int imageLength;
  final TextDirection direction;
  final List<String> joinedUsers;
  final double size;
  final double xShift;
  final bool isAddButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final items = <Widget>[];
    for (var i = 0; i < joinedUsers.length && i < imageLength; i++) {
      items.add(circleAvatar(joinedUsers[i]));
    }
    if (joinedUsers.length > imageLength) {
      items.add(moreAvatars(joinedUsers.length - imageLength));
    }

    final allItems = items
        .asMap()
        .map((index, item) {
          final left = size - xShift;

          final value = Container(
            width: size,
            height: size,
            margin: EdgeInsets.only(left: left * index),
            child: item,
          );

          return MapEntry(index, value);
        })
        .values
        .toList();

    return Row(
      children: [
        Stack(
          children: direction == TextDirection.ltr
              ? allItems.reversed.toList()
              : allItems,
        ),
        if (isAddButton) context.sized.emptySizedWidthBoxLow3x,
        if (isAddButton)
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(100),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(40, 40),
                  painter: DashedCirclePainter(),
                ),
                Assets.icons.bold.plusJust.svg(
                  width: 20,
                  height: 20,
                  color: theme.appColors.text,
                ),
              ],
            ),
          ),
      ],
    );
  }

  Container moreAvatars(
    int number, {
    Color color = Colors.white,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: MainColors.primary,
        radius: 25,
        child: PrimaryText(
          '+$number',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget circleAvatar(
    String imageUrl, {
    Color color = Colors.white,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 25,
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MainColors.neutral700
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    const step = 5; // Boşluklu çizgi aralığı
    const dashLength = 2; // Çizgi uzunluğu

    for (var i = 0; i < 360; i += step) {
      final x1 = center.dx + (radius - dashLength / 2) * cos(i * pi / 60);
      final y1 = center.dy + (radius - dashLength / 2) * sin(i * pi / 60);
      final x2 = center.dx + (radius + dashLength / 2) * cos(i * pi / 60);
      final y2 = center.dy + (radius + dashLength / 2) * sin(i * pi / 60);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
