import 'package:flutter/material.dart';

class DropShapeReversePainter extends CustomPainter {
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

    final dropPath = Path();
    dropPath.moveTo(size.width, 0);
    dropPath.quadraticBezierTo(size.width - 100, 100, size.width, 200);
    canvas.drawPath(dropPath, paint);
    final rect = Rect.fromLTWH(size.width, 0, 0, 0);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
