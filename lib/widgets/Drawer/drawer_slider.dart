import 'package:flutter/material.dart';

class DrawerSlider extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Path path = new Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
        size.width - 35, size.height / 2, size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
