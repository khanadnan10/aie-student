
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class ColumnLinearProgressbar extends StatelessWidget {
  final String text;
  final double value;
  const ColumnLinearProgressbar({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppFont.kBodyTextStyle.copyWith(
                  color: AppColor.kGrey,
                ),
              ),
              Text(
                '${value.toInt()}%',
                style: AppFont.kSmallTextStyle.copyWith(
                  color: AppColor.kGrey,
                ),
              ),
            ],
          ),
          LinearProgressIndicator(
            value: value / 100,
            minHeight: 8.0,
            borderRadius: BorderRadius.circular(10.0),
          )
        ],
      ),
    );
  }
}