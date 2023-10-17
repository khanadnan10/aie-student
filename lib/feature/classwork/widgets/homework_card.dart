// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class HomeworkCard extends StatelessWidget {
  final String subjectName;
  final String sent;

  final String homeworkTitle;
  final String homeworkbody;
  final ImageProvider<Object> image;
  const HomeworkCard({
    Key? key,
    required this.subjectName,
    required this.sent,
    required this.homeworkTitle,
    required this.homeworkbody,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0).copyWith(bottom: 10.0),
      decoration: BoxDecoration(
        gradient: AppColor.kPinkGradient,
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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subjectName,
                        style: AppFont.kHeadingTextStyle.copyWith(
                          fontSize: 12.0,
                          color: AppColor.kWhite,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Due on $sent',
                        style: AppFont.kBodyTextStyle.copyWith(
                          fontSize: 8.0,
                          color: AppColor.kWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Utils().sizedBox,
              Text(
                homeworkTitle,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: AppColor.kWhite,
                ),
              ),
              Text(
                homeworkbody,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kWhite,
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: -30,
            child: Image(
              image: image,
            ),
          )
        ],
      ),
    );
  }
}
