import 'package:student_ui/utils/colors.dart';
import 'package:flutter/material.dart';

class AppBarActionIcon extends StatelessWidget {
  final Icon icon;
  final Function() onTap;
  const AppBarActionIcon({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.kWhite,
          ),
          child: icon,
        ),
      ),
    );
  }
}
