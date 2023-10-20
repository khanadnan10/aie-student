
// DASHED LINE FOR THE BEST PERFORMANCE BAR CHART ------------------------------
import 'package:flutter/material.dart';

class VerticalDottedLine extends StatelessWidget {
  final double height; // Height of the line

  const VerticalDottedLine({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dotDiameter = 2.0; // Diameter of each circle
    const double dotSpacing = 4.0; //  Space between circles

    double startY = size.height - dotDiameter;
    int dotOpacity = 255; // Initial opacity

    while (startY >= 0) {
      final dotColor = const Color(0xff35C768).withOpacity(dotOpacity / 255.0);
      final paint = Paint()
        ..strokeCap = StrokeCap.round
        ..color = dotColor;

      canvas.drawCircle(
        Offset(size.width / 2, startY + dotDiameter / 2),
        dotDiameter / 2,
        paint,
      );

      dotOpacity -= 10; // Decrease opacity for the next dot
      if (dotOpacity < 0) {
        dotOpacity = 0;
      }

      startY -= dotDiameter + dotSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}