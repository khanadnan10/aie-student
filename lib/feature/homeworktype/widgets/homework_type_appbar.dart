import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

Widget homeworkTypeAppbar({
  String? subTitle,
  String? title,
  ImageProvider<Object>? image,
  BoxFit? fit,
  Gradient? gradient,
  bool? backgroundImage = false,
}) {
  return Container(
    width: double.infinity,
    // padding: const EdgeInsets.only(top: 40),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      ),
      image: backgroundImage == true
          ? const DecorationImage(
              image: AssetImage(
                'images/image 34.png',
              ),
              fit: BoxFit.cover,
            )
          : null,
      gradient: gradient ??
          const LinearGradient(
            colors: [
              Color(0x00ffffff),
              Color(0x00ffffff),
            ],
          ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Utils().sizedBox,
              Text(
                subTitle ?? '',
                style: AppFont.kBodyTextStyle.copyWith(
                  color: AppColor.kWhite,
                ),
              ),
              Text(
                title ?? '',
                style: AppFont.kLargeTopic24TextStyle.copyWith(
                  color: AppColor.kWhite,
                ),
              ),
            ],
          ),
          Expanded(
            child: Image(
              image: image ?? const AssetImage(''),
              fit: fit ?? BoxFit.contain,
            ),
          )
        ],
      ),
    ),
  );
}
