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

    final dropPath = Path();
    dropPath.moveTo(0, (size.height / 2) - 100);
    dropPath.quadraticBezierTo(
        100, size.height / 2, 0, (size.height / 2) + 100);
    path.addPath(dropPath, Offset.zero);

    path.fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
