import 'package:student_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:student_ui/utils/utils.dart';

class GradeAssignmentOutOfCard extends StatelessWidget {
  final Icon icon;
  final String fromCount;
  final String format;
  const GradeAssignmentOutOfCard({
    Key? key,
    required this.icon,
    required this.fromCount,
    required this.format,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: AppColor.kOceanBlue,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
        Utils(width: 10.0).sizedBox,
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    '$fromCount ', // include spacing in all fields to not include extra spaces explicitly
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kBlack,
                ),
              ),
              TextSpan(
                text:
                    format, // include spacing in all fields to not include extra spaces explicitly
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
