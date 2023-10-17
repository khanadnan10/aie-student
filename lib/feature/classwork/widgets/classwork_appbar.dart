// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:student_ui/feature/classwork/widgets/appbar_action_icon.dart';
import 'package:student_ui/utils/colors.dart';

class ClassworkAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Function() onTap;
  final Function() onSearch;
  final Function() onMessage;
  final Function() onNotification;
  final String image;
  final String profileImage;
  const ClassworkAppbar({
    Key? key,
    required this.onTap,
    required this.onSearch,
    required this.onMessage,
    required this.onNotification,
    required this.image,
    required this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      leading: IconButton(
        onPressed: onTap, // Leading icon
        icon: const Icon(
          Icons.menu,
          color: AppColor.kBlack,
        ),
      ),
      elevation: 0,
      toolbarHeight: kToolbarHeight + 30,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
      backgroundColor: Colors.transparent..withOpacity(0),
      actions: [
        AppBarActionIcon(
          icon: const Icon(
            Icons.search,
            color: AppColor.kPurple,
          ),
          onTap: onSearch,
        ),
        AppBarActionIcon(
          icon: const Icon(
            Icons.chat_bubble,
            color: AppColor.kPurple,
          ),
          onTap: onMessage,
        ),
        AppBarActionIcon(
            icon: const Icon(
              Icons.notifications,
              color: AppColor.kPurple,
            ),
            onTap: onNotification),
        Center(
          child: InkWell(
            onTap: () {
              //TODO: Navigate to profile of the user
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 45,
              width: 45,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.kWhite,
                image: DecorationImage(
                  image: AssetImage(profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);
}
