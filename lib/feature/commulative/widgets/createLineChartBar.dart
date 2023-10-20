// IMPORTANT: Function to create spots for every new line bar -----------------------------
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';

LineChartBarData createLineChartBarData(List<FlSpot> spots, Color color) {
  return LineChartBarData(
    spots: spots,
    color: color,
    isCurved: true,
    isStrokeCapRound: true,
    belowBarData: BarAreaData(
      gradient: LinearGradient(
        colors: [
          color.withOpacity(0.1),
          const Color(0xffffffff).withOpacity(0.1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      show: true,
    ),
    dotData: const FlDotData(show: false),
    barWidth: 4.0,
  );
}
