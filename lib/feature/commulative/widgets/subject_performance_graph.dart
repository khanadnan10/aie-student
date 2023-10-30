// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:student_ui/feature/commulative/widgets/line_charts.dart';

class SubjectPerformancegraph extends StatelessWidget {
  final List<LineChartBarData> lineChartBarData;
  const SubjectPerformancegraph({
    Key? key,
    required this.lineChartBarData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 150,
      child: CustomLineChartbar(
        lineChartBarData: [...lineChartBarData],
      ),
    );
  }
}
