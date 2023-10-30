// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';

class CustomLineChartbar extends StatelessWidget {
  final List<LineChartBarData> lineChartBarData;
  final bool? showTitleData;
  final bool? showGridData;
  final String? preTouchSpot;
  final bool? isMultibars;

  final String? postTouchSpot;
  const CustomLineChartbar({
    Key? key,
    required this.lineChartBarData,
    this.showTitleData,
    this.showGridData,
    this.preTouchSpot,
    this.isMultibars = false,
    this.postTouchSpot,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const border = Border(
      top: BorderSide.none,
      right: BorderSide.none,
      bottom: BorderSide.none,
      left: BorderSide.none,
    );
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: AppColor.kGreen,
            tooltipRoundedRadius: 20.0,
            showOnTopOfTheChartBoxArea: false,
            fitInsideHorizontally: true,
            tooltipMargin: 0,
            getTooltipItems: (touchedSpots) => touchedSpots
                .asMap()
                .entries
                .map(
                  (e) => LineTooltipItem(
                    '${'${e.value.spotIndex} ${preTouchSpot ?? 'min'}'}${postTouchSpot ?? '%'}',
                    const TextStyle(color: Colors.white),
                  ),
                )
                .toList(),
          ),
        ),
        maxX: 8,
        minY: 0,
        maxY: isMultibars == false ? 6 : 4,
        gridData: FlGridData(
          show: showGridData ?? true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: AppColor.kGrey,
              dashArray: [2],
              strokeWidth: 1,
            );
          },
          drawHorizontalLine: true,
          drawVerticalLine: false,
        ),
        titlesData: FlTitlesData(
          show: showTitleData ?? true,
          bottomTitles: const AxisTitles(
            drawBelowEverything: false,
          ),
          rightTitles: const AxisTitles(drawBelowEverything: false),
          topTitles: const AxisTitles(drawBelowEverything: false),
          leftTitles: AxisTitles(
            drawBelowEverything: true,
            axisNameSize: 10.0,
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                String text = '';
                switch (value.toInt()) {
                  case 0:
                    text = '20%';
                    break;
                  case 1:
                    text = '40%';
                    break;
                  case 2:
                    text = '60%';
                    break;
                  case 3:
                    text = '80%';
                    break;
                  case 4:
                    text = '100%';
                    break;
                  default:
                    Container();
                }
                return Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
          border: border,
        ),
        lineBarsData: lineChartBarData,
      ),
    );
  }
}

//

// // FAKE DATA -----------------------------------------------------------------------
// List<LineChartBarData> lineChartData = [
//   LineChartBarData(
//     spots: [
//       const FlSpot(-1.0, 1),
//       const FlSpot(0, 1),
//       const FlSpot(2.2, 3),
//       const FlSpot(4.9, 5),
//       const FlSpot(6.8, 3),
//       const FlSpot(8, 4),
//       const FlSpot(9.5, 3),
//       const FlSpot(11, 4),
//     ],
//     color: AppColor.kBlue,
//     isCurved: true,
//     isStrokeCapRound: true,
//     belowBarData: BarAreaData(
//       gradient: LinearGradient(
//         colors: [
//           AppColor.kBlue.withOpacity(0.1),
//           const Color(0xffffffff).withOpacity(0.1),
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ),
//       show: true,
//     ),
//     dotData: const FlDotData(show: false),
//     barWidth: 4.0,
//   ),
//   LineChartBarData(
//     spots: [
//       const FlSpot(-1, 0.2),
//       const FlSpot(1, 4),
//       const FlSpot(2.2, 2.8),
//       const FlSpot(4, 5.5),
//       const FlSpot(5, 3.8),
//       const FlSpot(6, 4.5),
//       const FlSpot(9.5, 3),
//       const FlSpot(11, 4),
//     ],
//     color: AppColor.kYellow,
//     isCurved: true,
//     isStrokeCapRound: true,
//     belowBarData: BarAreaData(
//       gradient: LinearGradient(
//         colors: [
//           AppColor.kYellow.withOpacity(0.1),
//           const Color(0xffffffff).withOpacity(0.1),
//         ],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ),
//       show: true,
//     ),
//     dotData: const FlDotData(show: false),
//     barWidth: 4.0,
//   ),
// ];
