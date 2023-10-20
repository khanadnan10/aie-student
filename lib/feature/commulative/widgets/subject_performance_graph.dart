// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:student_ui/feature/commulative/widgets/createLineChartBar.dart';
import 'package:student_ui/feature/commulative/widgets/line_charts.dart';
import 'package:student_ui/utils/colors.dart';

class SubjectPerformancegraph extends StatelessWidget {
  final Size? size;
  const SubjectPerformancegraph({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 150,
      child: CustomLineChartbar(
        lineChartBarData: [
          createLineChartBarData([
            const FlSpot(-1.0, 1),
            const FlSpot(0, 1),
            const FlSpot(2.2, 3),
            const FlSpot(4.9, 5),
            const FlSpot(6.8, 3),
            const FlSpot(8, 4),
          ], AppColor.kBlue),
          createLineChartBarData(
            [
              const FlSpot(-1, 0.2),
              const FlSpot(1, 4),
              const FlSpot(2.2, 2.8),
              const FlSpot(4, 5.5),
              const FlSpot(5, 3.8),
              const FlSpot(6, 4.5),
              const FlSpot(11, 4),
            ],
            AppColor.kYellow,
          ),
          createLineChartBarData(
            [
              const FlSpot(-1, 1.5),
              const FlSpot(1, 4),
              const FlSpot(2.2, 2.8),
              const FlSpot(3.3, 3.5),
              const FlSpot(5, 3.8),
              const FlSpot(6.2, 6.5),
            ],
            AppColor.kPurple,
          ),
        ],
      ),
    );
  }
}
