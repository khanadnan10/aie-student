// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:student_ui/feature/commulative/data/shape.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class AchievementMessageCard extends StatelessWidget {
  final String text;
  final ImageProvider<Object> image;
  const AchievementMessageCard({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Sparking celebration --------------------------------------
        for (int i = 0; i < sparkShape.length; i++)
          Positioned(
            left: i * 50,
            top: (i % 2 != 0)
                ? 0
                : 5, // Change the position according to the nature of odd and even
            child: Container(
              height: sparkShape[i],
              width: sparkShape[i],
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: sparkColors[i],
              ),
            ),
          ),
        // Achievement Message Container -----------------------------
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColor.kPurple,
            ),
            borderRadius: BorderRadius.circular(26.0),
          ),
          child: Row(
            children: [
              Image(
                height:
                    63.0, // Magic Number used according to the figma size ---
                image: image,
                fit: BoxFit.cover,
              ),
              Utils(width: 12.0).sizedBox,
              Flexible(
                child: Text(
                  text,
                  style: AppFont.kHeadingLightTextStyle.copyWith(
                    color: AppColor.kGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
