
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class TeachersRemarkCard extends StatelessWidget {
  final String image;
  final String name;
  final String subject;
  final String timeAgo;
  final String remark;
  const TeachersRemarkCard({
    Key? key,
    required this.image,
    required this.name,
    required this.subject,
    required this.timeAgo,
    required this.remark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: AppColor.kGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25.0)),
      child: Column(
        children: [
          // Teacher info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(image),
                  ),
                  Utils(width: 8).sizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppFont.kHeadingTextStyle,
                      ),
                      Text(
                        subject,
                        style: AppFont.kBodyTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                timeAgo,
                style: AppFont.kSmallTextStyle,
              ),
            ],
          ),
          Utils().sizedBox,
          //Teacher remark details
          Text(
            remark,
            style: AppFont.kHeadingLightTextStyle,
          ),
        ],
      ),
    );
  }
}
