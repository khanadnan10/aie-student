import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGaugeCard extends StatelessWidget {
  final String text;
  final double percent;
  const RadialGaugeCard({
    Key? key,
    required this.text,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          interval: 10,
          startAngle: 160,
          endAngle: 380,
          showTicks: false,
          showLabels: false,
          axisLineStyle: const AxisLineStyle(
            thickness: 12,
            cornerStyle: CornerStyle.bothCurve,
            color: AppColor.kWhite,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: percent,
              width: 12,
              color: AppColor.kPurple,
              enableAnimation: true,
              sizeUnit: GaugeSizeUnit.logicalPixel,
              cornerStyle: CornerStyle.bothCurve,
            ),
          ],
          canScaleToFit: true,
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Column(
                children: [
                  Container(
                    width: 50.00,
                    height: 50.00,
                    decoration: BoxDecoration(
                      color: AppColor.kPurple.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.track_changes_outlined,
                      ),
                    ),
                  ),
                  Utils().sizedBox,
                  Column(
                    children: [
                      Text(
                        text,
                        style: AppFont.kBodyTextStyle.copyWith(
                          color: AppColor.kGrey,
                        ),
                      ),
                      Text(
                        '${percent.toInt().toString()}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: AppColor.kGrey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              positionFactor: 0.4,
              angle: 90,
            ),
          ],
        ),
      ],
    );
  }
}
