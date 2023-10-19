import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class TotalGradeGradientText extends StatelessWidget {
  final String marksObtained;
  final String outOfMarks;
  const TotalGradeGradientText({
    Key? key,
    required this.marksObtained,
    required this.outOfMarks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return AppColor.kReversePinkGradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        '$marksObtained/$outOfMarks',
        style: AppFont.kLargeTopic40TextStyle,
      ),
    );
  }
}
