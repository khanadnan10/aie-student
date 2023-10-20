// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/feature/homeworktype/widgets/homework_type_appbar.dart';
import 'package:student_ui/utils/colors.dart';

class CommonAppbar extends StatelessWidget implements PreferredSize {
  final String? title;
  final String? subTitle;
  final ImageProvider<Object>? image;
  final Gradient? gradient;
  final String? text;
  final VoidCallback onIconTap;
  final bool? boxRequired;
  final bool? isBackgroundImage;
  final Color? leadingColor;
  const CommonAppbar({
    Key? key,
    // Enable this if required the container having image and text
    this.title,
    this.subTitle,
    this.image,
    this.gradient,
    this.text,
    required this.onIconTap,
    this.boxRequired = true,
    this.isBackgroundImage = false,
    this.leadingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: kToolbarHeight,
      title: Text(
        text ?? '',
        style: const TextStyle(
          color: AppColor.kGrey,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      flexibleSpace: boxRequired == true
          ? homeworkTypeAppbar(
              title: title,
              subTitle: subTitle,
              gradient: gradient,
              image: image,
              backgroundImage: isBackgroundImage,
            )
          : null,
      centerTitle: true,
      leading: GestureDetector(
        onTap: onIconTap, // Navigator
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColor.kWhite,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: leadingColor ?? AppColor.kOceanBlue,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (boxRequired == true ? 80 : 10));

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
