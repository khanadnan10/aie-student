import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class StatsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const StatsCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColor.kPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColor.kPurple,
            size: 30,
          ),
          Utils(width: 5).sizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppFont.kBodyTextStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColor.kGrey,
                ),
              ),
              Text(
                body,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppFont.kHeadingTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
