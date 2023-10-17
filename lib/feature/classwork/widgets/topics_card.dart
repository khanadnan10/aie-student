// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class TopicsCard extends StatelessWidget {
  final String subjectName;
  final VoidCallback onTap;
  final String homeworkTitle;
  const TopicsCard({
    Key? key,
    required this.subjectName,
    required this.onTap,
    required this.homeworkTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        gradient: AppColor.kBlueGradient,
        borderRadius: BorderRadius.circular(24.0),
        image: const DecorationImage(
          colorFilter: ColorFilter.srgbToLinearGamma(),
          image: AssetImage(
            'images/image 36teacher_work_mask.png',
          ),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subjectName,
            style: AppFont.kHeadingTextStyle.copyWith(
              fontSize: 12.0,
              color: AppColor.kWhite,
              fontWeight: FontWeight.w700,
            ),
          ),
          Utils().sizedBox,
          Utils().sizedBox,
          Text(
            homeworkTitle,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: AppColor.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
