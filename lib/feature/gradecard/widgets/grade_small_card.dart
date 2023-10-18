// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class GradeSmallCard extends StatelessWidget {
  final String topic;
  final String percent;
  final String perRate;
  final Gradient? gradient;
  const GradeSmallCard({
    Key? key,
    required this.topic,
    required this.percent,
    required this.perRate,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.18,
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        gradient: gradient ?? AppColor.kPinkGradient,
        borderRadius: BorderRadius.circular(24.0),
        image: const DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.srgbToLinearGamma(),
          image: AssetImage(
            'images/image 34.png',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topic,
            style: AppFont.kTopicLiteTextStyle.copyWith(color: AppColor.kWhite),
          ),
          Utils().sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$percent%',
                    softWrap: true,
                    textAlign: TextAlign.start,
                    style: AppFont.kLargeTopicTextStyle.copyWith(
                      color: AppColor.kWhite,
                      fontSize: 40.0,
                    ),
                  ),
                  Utils(width: 5).sizedBox,
                  Text(
                    perRate,
                    style: AppFont.kHeadingTextStyle
                        .copyWith(color: AppColor.kGreen, letterSpacing: 1),
                  ),
                  const Icon(
                    Icons.arrow_upward_rounded,
                    color: AppColor.kGreen,
                    size: 20.0,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'View  Subjects',
                    style: AppFont.kBodyTextStyle.copyWith(
                      color: AppColor.kWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
