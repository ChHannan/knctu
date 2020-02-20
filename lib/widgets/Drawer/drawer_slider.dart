import 'package:flutter/material.dart';

class DrawerSlider extends StatelessWidget {
  const DrawerSlider({
    Key key,
    @required this.deviceHeight,
  }) : super(key: key);

  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawerSliderPainter(),
      child: Container(
        height: deviceHeight * 0.14,
        width: 19,
        child: Icon(
          Icons.arrow_left,
          color: Colors.white,
        ),
      ),
    );
  }
}

class DrawerSliderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xFF19b7c6).withOpacity(0.7)
      ..style = PaintingStyle.fill;

    Path path = new Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
      size.width - 30,
      size.height / 2,
      size.width,
      size.height,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
