import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class RecommendationTextCard extends StatelessWidget {
  final String text;
  const RecommendationTextCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          width: 1,
          color: AppColor.kPurple,
        ),
      ),
      child: Text(
        text,
        style: AppFont.kHeadingLightTextStyle.copyWith(
          color: AppColor.kGrey,
        ),
      ),
    );
  }
}
