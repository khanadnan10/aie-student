
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class LeaderBoardRunnerUpCard extends StatelessWidget {
  final String image;
  final String rank;
  final String name;
  final String percent;
  const LeaderBoardRunnerUpCard({
    Key? key,
    required this.image,
    required this.rank,
    required this.name,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rank,
                  style: AppFont.kHeadingTextStyle,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    image,
                  ),
                ),
                Text(
                  name,
                  style: AppFont.kHeadingTextStyle,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              percent,
              overflow: TextOverflow.ellipsis,
              style: AppFont.kHeadingTextStyle.copyWith(
                color: AppColor.kPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
