// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class ShortInfoCard extends StatelessWidget {
  final String title;
  final String role;
  final String image;
  final Function onCall;
  final Function onMessage;
  final bool isDetailListCard;
  const ShortInfoCard({
    Key? key,
    required this.title,
    required this.role,
    required this.image,
    required this.onCall,
    required this.onMessage,
    this.isDetailListCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: !isDetailListCard
            ? Border.all(
                width: 2,
                color: AppColor.kOceanBlue,
              )
            : null,
        color: isDetailListCard ? AppColor.kWhite : null,
        borderRadius: BorderRadius.circular(
          50.0,
        ),
      ),
      margin: isDetailListCard ? const EdgeInsets.symmetric(vertical: 5) : null,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              image,
            ),
            radius: 25,
          ),
          Utils(width: 5).sizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFont.kHeadingTextStyle.copyWith(fontSize: 16.0),
                ),
                Text(
                  role,
                  style: AppFont.kBodyTextStyle.copyWith(
                    fontSize: 12.0,
                    color: AppColor.kBlack.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onCall(),
            icon: const Icon(
              Icons.call,
              color: AppColor.kOceanBlue,
            ),
          ),
          IconButton(
            onPressed: onMessage(),
            icon: const Icon(
              Icons.messenger,
              color: AppColor.kOceanBlue,
            ),
          ),
        ],
      ),
    );
  }
}
