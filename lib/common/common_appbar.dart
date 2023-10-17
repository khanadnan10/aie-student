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
  const CommonAppbar({
    Key? key,
    this.title,
    this.subTitle,
    this.image,
    this.gradient,
    this.text,
    required this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: kToolbarHeight,
      title: Text(
        text ?? '',
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      flexibleSpace: homeworkTypeAppbar(
        title: title,
        subTitle: subTitle,
        gradient: gradient,
        image: image ?? const AssetImage(''),
      ),
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
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.kOceanBlue,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 80);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
