import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class AllSubjectCard extends StatelessWidget {
  final String subject;
  final String marks;
  final String percent;

  const AllSubjectCard({
    Key? key,
    required this.subject,
    required this.marks,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26.0),
      decoration: BoxDecoration(
        gradient: AppColor.kReverseSkyGradient,
        borderRadius: BorderRadius.circular(24.0),
        image: const DecorationImage(
          image: AssetImage('images/image 34.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subject,
            style: AppFont.kHeadingLightTextStyle.copyWith(
              color: AppColor.kWhite,
            ),
          ),
          Utils().sizedBox,
          Column(
            children: [
              Text(
                '$marks/200',
                style: AppFont.kLargeTopic24TextStyle.copyWith(
                  color: AppColor.kWhite,
                ),
              ),
              Text(
                '$percent%',
                style: AppFont.kBodyTextStyle.copyWith(
                  color: AppColor.kWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
