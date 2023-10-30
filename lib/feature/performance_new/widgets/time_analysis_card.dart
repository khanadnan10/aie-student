import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TimeAnalysisCard extends StatelessWidget {
  final double timeTaken;
  final double totalTime;
  const TimeAnalysisCard({
    Key? key,
    required this.timeTaken,
    required this.totalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            minimum: 0,
            maximum: totalTime,
            showLabels: false,
            showTicks: false,
            startAngle: 360,
            endAngle: 360,
            showAxisLine: true,
            axisLineStyle: const AxisLineStyle(
              thickness: 10.0,
              color: AppColor.kWhite,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                color: AppColor.kPurple,
                value: timeTaken,
                width: 0.95,
                pointerOffset: 0.05,
                sizeUnit: GaugeSizeUnit.factor,
              ),
            ],
            canScaleToFit: true,
            
          ),
        ],
      ),
    );
  }
}
