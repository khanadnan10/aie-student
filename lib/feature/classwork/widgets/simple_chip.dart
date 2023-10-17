import 'package:student_ui/utils/colors.dart';
import 'package:flutter/material.dart';

class SimpleTextChip extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const SimpleTextChip({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.kGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColor.kGrey,
          ),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
