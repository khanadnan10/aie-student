// Type Indicator for the circular progress percentage in performance section===
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class TypeIndicator extends StatelessWidget {
  final String count;
  final String text;
  final Color color;
  const TypeIndicator({
    Key? key,
    required this.count,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8.0,
          backgroundColor: color,
        ),
        Utils(width: 5).sizedBox,
        Text(
          '$text: ',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          count, // total question -----------------------
          style: AppFont.kBodyTextStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
