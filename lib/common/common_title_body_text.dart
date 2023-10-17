import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class CommonTitleBodyText extends StatelessWidget {
  final String title;
  final String body;
  const CommonTitleBodyText({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          body,
          style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
        ),
        Utils().sizedBox,
      ],
    );
  }
}
