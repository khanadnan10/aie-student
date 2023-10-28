
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class FeedCountCard extends StatelessWidget {
  final String title;
  final String count;
  final String upstream;
  final String comment;

  const FeedCountCard({
    Key? key,
    required this.title,
    required this.count,
    required this.upstream,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: AppColor.kPurple.withOpacity(0.2),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            title,
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Row(
            children: [
              Text(
                count,
                style: AppFont.kLargeTopic24TextStyle.copyWith(
                  color: AppColor.kGrey,
                ),
              ),
              Utils(width: 5).sizedBox,
              Row(
                children: [
                  Text(
                    upstream,
                    style: AppFont.kBodyTextStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColor.kLiteGreen),
                  ),
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Icon(
                      Icons.arrow_right_alt_rounded,
                      color: AppColor.kLiteGreen,
                      size: 18.0,
                    ),
                  )
                ],
              ),
            ],
          ),
          Text(
            comment,
            style: AppFont.kSmallTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
        ],
      ),
    );
  }
}
