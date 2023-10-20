// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:student_ui/feature/commulative/data/pie_data.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class TotalGradeChart extends StatefulWidget {
  List<PieChartSectionData>? sections;
  TotalGradeChart({
    Key? key,
    required this.sections,
  }) : super(key: key);

  @override
  State<TotalGradeChart> createState() => _TotalGradeChartState();
}

class _TotalGradeChartState extends State<TotalGradeChart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
              borderData: FlBorderData(
                show: false,
              ),
              pieTouchData: PieTouchData(
                enabled: true,
              ),
              startDegreeOffset: -60,
              sectionsSpace: 3,
              sections: widget.sections,
            ),
          ),
        ),
        Utils(width: 10).sizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: PieData.data.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.name,
                    style: AppFont.kBodyTextStyle,
                  ),
                  Utils(width: 5).sizedBox,
                  Container(
                    height: 16.0,
                    width: 16.0,
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: data.color,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
