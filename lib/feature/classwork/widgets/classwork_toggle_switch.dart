// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';

class ClassworkToggleSwitch extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String text;
  final VoidCallback onTap;
  final bool? isSmall;
  const ClassworkToggleSwitch({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.text,
    required this.onTap,
    this.isSmall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: index == currentIndex ? AppColor.kPurple : Colors.transparent,
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: EdgeInsets.symmetric(
                horizontal: isSmall == true ? 20.0 : 16.0, vertical: 12.0)
            .copyWith(),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: index == currentIndex ? AppColor.kWhite : AppColor.kGrey,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
