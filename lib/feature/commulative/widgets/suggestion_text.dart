
import 'package:flutter/material.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class SuggestionText extends StatelessWidget {
  final String text;
  const SuggestionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Utils(height: 5).sizedBox,
                const CircleAvatar(
                    backgroundColor: Colors.deepPurple, radius: 6),
              ],
            ),
            Utils(width: 15).sizedBox,
            Flexible(
              child: Text(
                text,
                style: AppFont.kHeadingLightTextStyle,
              ),
            ),
          ],
        ),
        Utils().sizedBox,
      ],
    );
  }
}
