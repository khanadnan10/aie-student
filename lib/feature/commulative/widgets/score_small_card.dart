// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:student_ui/common/enum.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class ScoreSmallCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final Icon? icon;
  final ScoreCard scoreCardType;
  final Gradient? gradient;
  final String? marks;
  const ScoreSmallCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.icon,
    required this.scoreCardType,
    this.gradient,
    this.marks = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
            gradient: gradient ?? AppColor.kReverseSkyGradient,
            borderRadius: BorderRadius.circular(26.0)),
        padding: const EdgeInsets.all(26.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFont.kHeadingTextStyle.copyWith(
                    color: AppColor.kWhite,
                  ),
                ),
                Text(
                  subTitle,
                  style: AppFont.kBodyTextStyle.copyWith(
                    color: AppColor.kWhite,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                    decorationColor: AppColor.kWhite,
                  ),
                ),
              ],
            ),
            if (scoreCardType == ScoreCard.text)
              Text(
                '$marks/100',
                style: AppFont.kLargeTopic24TextStyle.copyWith(
                  color: AppColor.kWhite,
                ),
              )
            else
              icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
