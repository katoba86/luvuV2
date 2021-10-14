import 'package:flutter/material.dart';

class DefaultPaint extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final gradient = LinearGradient(colors: [
      const Color.fromRGBO(163, 215, 221,1),
      Colors.white.withOpacity(1),
    ],begin: Alignment.topCenter,end: Alignment.bottomCenter);

    var rect = Offset.zero & size;

    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}