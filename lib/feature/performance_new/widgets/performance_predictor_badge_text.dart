// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class PerformancePredictorBadgeText extends StatelessWidget {
  const PerformancePredictorBadgeText({
    Key? key,
    required this.currentPerformance,
    required this.currentGrade,
    required this.icon,
  }) : super(key: key);
  final String currentPerformance;
  final String currentGrade;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: const BoxDecoration(
            color: AppColor.kPurple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                    text: 'Current performance', style: AppFont.kBodyTextStyle),
                const TextSpan(text: ' '), // spacing
                TextSpan(
                    text: '$currentPerformance%',
                    style: AppFont
                        .kBodyTextStyle), // representing the percentage of the curretn performance
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              width: 1,
              color: AppColor.kPurple,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Icon(
                icon,
                color: AppColor.kPurple,
              ),
              Text(
                'Current Grade $currentGrade',
                style: AppFont.kHeadingLightTextStyle.copyWith(
                  color: AppColor.kGrey,
                ),
              ),
               Icon(
                icon,
                color: AppColor.kPurple,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
