import 'dart:math';

import 'package:flutter/material.dart';


class CustomTimeCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCirclePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    Paint innerCirclePaint = Paint()
      ..color = Color.fromRGBO(28, 94, 186, 1)
      ..style = PaintingStyle.fill;

    Paint innerCirclePaint2 = Paint()
      ..color = Color.fromRGBO(19, 75, 157, 1)
      ..style = PaintingStyle.fill;
     // ..strokeWidth = 100;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double outerRadius = size.width / 2 - 10;
    double innerRadius = size.width / 2.2;
    double innerRadius2 = size.width / 4.2;
  //  canvas.drawCircle(Offset(centerX, centerY), outerRadius, outerCirclePaint);
  //  canvas.drawCircle(Offset(centerX, centerY), innerRadius, innerCirclePaint);

    canvas.drawCircle(Offset(centerX, centerY), outerRadius, outerCirclePaint);
    canvas.drawCircle(Offset(centerX, centerY), innerRadius, innerCirclePaint);
    canvas.drawCircle(Offset(centerX, centerY), innerRadius2, innerCirclePaint2);


    final double centerX1 = size.width / 2;
    final double centerY1 = size.height / 2;
    final Paint paint = Paint()..color = Colors.white70;
    final double filledCircleRadius = 3;
    final int numberOfDots = 20;
    final double radiantStep = 2 * pi / numberOfDots;
    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX1 + sin(i * radiantStep) * 108,
            centerY1 + cos(i * radiantStep) * 108),
        filledCircleRadius,
        paint,
      );
    }


    Paint linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
    ..strokeWidth = 5;
    canvas.drawLine(Offset(centerX1+105,67), Offset(centerX1+170,67), linePaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

