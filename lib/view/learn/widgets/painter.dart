import 'dart:math';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color= Colors.grey[800]!.withOpacity(0.8);
    paint.style=PaintingStyle.fill;

     RRect roundedRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, size.height / 3, size.width, size.height*1.2),
      topLeft: const Radius.circular(10),
      topRight: const Radius.circular(10),
      bottomLeft: const Radius.circular(10),
      bottomRight: const Radius.circular(10),
    );
    canvas.drawRRect(roundedRect, paint);


    double radius = size.width / 6; 
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 3),
        radius: radius,
      ),
      pi,
      pi,
      true,
      paint,
    );

    final borderPaint = Paint();

      borderPaint.color = const Color.fromRGBO(167, 186, 255, 1);
      borderPaint.style = PaintingStyle.stroke;
      borderPaint.strokeWidth = 4;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, size.height / 3, size.width, size.height * 1.2),
        const Radius.circular(10),
      ),
      borderPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 3),
        radius: radius,
      ).inflate(1),
      pi,
      pi,
      false,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}