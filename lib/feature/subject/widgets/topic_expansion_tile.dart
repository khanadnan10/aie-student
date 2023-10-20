// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class TopicExpansionTile extends StatelessWidget {
  final String heading;
  final String subTitle;
  final String name;
  final String subject;
  final String timeAgo;
  final String remark;
  final String marks;
  final ImageProvider<Object> image;
  final Gradient?
      gradient; // Change according to the list style ... not necessary

  const TopicExpansionTile({
    Key? key,
    required this.heading,
    required this.subTitle,
    required this.name,
    required this.subject,
    required this.timeAgo,
    required this.remark,
    required this.marks,
    required this.image,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const initiallyExpanded = false;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        gradient: gradient ?? AppColor.kPinkGradient,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        iconColor: AppColor.kWhite,
        subtitle: Text(
          'Submitted on $subTitle',
          style: AppFont.kSmallTextStyle.copyWith(
            color: AppColor.kWhite,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              heading,
              style: const TextStyle(
                color: AppColor.kWhite,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '$marks/10',
              style: AppFont.kLargeTopic24TextStyle.copyWith(
                color: AppColor.kWhite,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        collapsedBackgroundColor: Colors.transparent,
        collapsedIconColor: AppColor.kWhite,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.topLeft,
        childrenPadding: const EdgeInsets.all(16.0),
        children: [
          // user info ---------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: image,
                  ),
                  Utils(width: 10).sizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppFont.kHeadingTextStyle.copyWith(
                          color: AppColor.kWhite,
                        ),
                      ),
                      Text(
                        subject,
                        style: AppFont.kBodyTextStyle.copyWith(
                          color: AppColor.kWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                timeAgo,
                style: AppFont.kSmallTextStyle.copyWith(
                  color: AppColor.kWhite,
                ),
              ),
            ],
          ),
          Utils().sizedBox,
          // Remarks info ---------------------------------------------------------
          Text(
            remark,
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
