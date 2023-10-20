// ignore_for_file: public_member_api_docs, sort_constructors_first
// Type Indicator for the circular progress percentage in performance section===
import 'package:flutter/material.dart';

import 'package:student_ui/common/enum.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class TypeIndicator extends StatelessWidget {
  final String count;
  final String text;
  final Color? indicationColor;
  final IncludeColor includeColor;
  const TypeIndicator({
    Key? key,
    required this.count,
    required this.text,
    this.indicationColor,
    this.includeColor = IncludeColor.yes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        includeColor == IncludeColor.yes
            ? CircleAvatar(
                radius: 8.0,
                backgroundColor: indicationColor,
              )
            : const SizedBox(),
        Utils(width: 5).sizedBox,
        Flexible(
          child: Text(
            '$text: ',
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
              fontWeight: FontWeight.w700,
            ),
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
