
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class ScoreSmallCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String marks;
  const ScoreSmallCard({
    Key? key,
    required this.title,
    required this.onTap,
    required this.marks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          gradient: AppColor.kReverseSkyGradient,
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
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'View all',
                  style: AppFont.kBodyTextStyle.copyWith(
                    color: AppColor.kWhite,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.kWhite,
                  ),
                ),
              ),
            ],
          ),
          Text(
            '$marks/100',
            style: AppFont.kLargeTopic24TextStyle.copyWith(
              color: AppColor.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
