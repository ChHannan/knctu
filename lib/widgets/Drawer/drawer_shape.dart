import 'package:flutter/material.dart';

class DrawerShape extends CustomPainter {
  double heightPosition;

  DrawerShape({this.heightPosition});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    Path path = new Path();
    path.lineTo(0, heightPosition * 0.7);
    path.quadraticBezierTo(
        -30, heightPosition * 0.77, 0, heightPosition * 0.84);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
