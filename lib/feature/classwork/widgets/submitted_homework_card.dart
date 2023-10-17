// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class SubmittedHomeworkCard extends StatelessWidget {
  final String subjectName;
  final String sent;
  final String marks;
  final String homeworkTitle;
  final String homeworkbody;
  final ImageProvider<Object> image;
  const SubmittedHomeworkCard({
    Key? key,
    required this.subjectName,
    required this.sent,
    required this.marks,
    required this.homeworkTitle,
    required this.homeworkbody,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          gradient: AppColor.kYelloGradient,
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
          children: [
            Stack(
              clipBehavior: Clip.none,
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
                      'Submitted on $sent',
                      style: AppFont.kBodyTextStyle.copyWith(
                        fontSize: 8.0,
                        color: AppColor.kWhite,
                      ),
                    ),
                    Utils().sizedBox,
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '$marks/10',
                              style: AppFont.kLargeTopicTextStyle.copyWith(
                                color: AppColor.kWhite,
                              ),
                            ),
                            // Only for spacing ---------------------------
                            Utils().sizedBox,
                            // Only for spacing ---------------------------
                          ],
                        ),
                      ],
                    ),
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
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
          ],
        ),
      ),
    );
  }
}
