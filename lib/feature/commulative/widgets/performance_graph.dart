// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:student_ui/feature/commulative/widgets/line_charts.dart';

class Performancegraph extends StatelessWidget {
  final Size? size;
  final bool? showTitleData;
  final bool? showGridData;
  final String? preTouchSpot;
  final String? postTouchSpot;
  final bool? multibars;
  final List<LineChartBarData> commulativeLineChartBarData;
  const Performancegraph({
    Key? key,
    this.size,
    this.showTitleData,
    this.showGridData,
    this.preTouchSpot,
    this.postTouchSpot,
    this.multibars,
    required this.commulativeLineChartBarData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 150,
      child: CustomLineChartbar(
        isMultibars: multibars,
        postTouchSpot: postTouchSpot,
        preTouchSpot: preTouchSpot,
        showGridData: showGridData ?? true,
        showTitleData: showTitleData ?? true,
        lineChartBarData: [...commulativeLineChartBarData],
      ),
    );
  }
}
