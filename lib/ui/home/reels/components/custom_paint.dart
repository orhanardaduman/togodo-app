import 'package:flutter/material.dart';

class DropShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(
        32,
        198,
        165,
        .5,
      )
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.zero);

    final path = Path()..addRRect(rrect);

    ///////
    const curve = Curves.easeOut;

    final d = 0 + 25 * 2;
    final r = d / 2;
    final w = 50;
    final h = size.height;
    final xMax = size.width - 0 / 2 - 25;
    final y = h/2;
    final x = 25;

    const sideOffsetCurve = Interval(0.5, 0.8, curve: Curves.easeInOut);
    final anchorOffset = r * 8.0 + curve.transform(0) * xMax * 1.8;
    final anchorSpread = r * 11.0 + curve.transform(0) * xMax * 1.2;
    final apexSpread = r * 3+ curve.transform(0) * xMax * 0.5;
    final dropPath = Path();

    final sideOffset = 0.0 ;
    dropPath
      ..lineTo(sideOffset, y - anchorOffset)  // w - sideOffset yerine sideOffset
      ..cubicTo(
        /// Control handle A (X ekseni ters çevrildi)
        sideOffset,  // w - sideOffset yerine sideOffset
        y - anchorOffset + anchorSpread / 2,

        /// Control handle B (X ekseni ters çevrildi)
        w - x + r,  // x - r yerine w - x + r
        y - apexSpread,

        /// Given point (X ekseni ters çevrildi)
        w - x + r,  // x - r yerine w - x + r
        y,
      )
      ..cubicTo(
        /// Control handle A (X ekseni ters çevrildi)
        w - x + r,  // x - r yerine w - x + r
        y + apexSpread,

        /// Control handle B (X ekseni ters çevrildi)
        sideOffset,  // w - sideOffset yerine sideOffset
        y + anchorOffset - anchorSpread / 2,

        /// Given point (X ekseni ters çevrildi)
        sideOffset,  // w - sideOffset yerine sideOffset
        y + anchorOffset,
      );


    path.addPath(dropPath, Offset.zero);

    path.fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
