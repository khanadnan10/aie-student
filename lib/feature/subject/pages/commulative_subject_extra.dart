// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/feature/subject/data/data.dart';
import 'package:student_ui/feature/subject/widgets/topic_expansion_tile.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class SubjectExtra extends StatefulWidget {
  const SubjectExtra({super.key});

  @override
  State<SubjectExtra> createState() => _SubjectExtraState();
}

class _SubjectExtraState extends State<SubjectExtra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        onIconTap: () {
          // Navigating to previous page
          Navigator.pop(context);
        },
        boxRequired: true,
        gradient: AppColor.kPinkGradient,
        enableBackgroundImage: true,
        image: const AssetImage(
          'images/juicy-young-man-looks-at-his-watch-during-an-exam 1.png',
        ),
        title:
            'English', // The title should be passed through the MODEL ROUTE  ---------------------
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // List for the todays homework section
            const Text(
              'Today’s Homeworks',
              style: AppFont.kHeadingTextStyle,
            ),
            Utils().sizedBox,
            ListView.builder(
              itemCount: subjectExtraData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TopicExpansionTile(
                  heading: subjectExtraData[index]['heading'],
                  subTitle: subjectExtraData[index]['subTitle'],
                  name: subjectExtraData[index]['name'],
                  subject: subjectExtraData[index]['subject'],
                  timeAgo: subjectExtraData[index]['timeAgo'],
                  remark: subjectExtraData[index]['remark'],
                  marks: subjectExtraData[index]['marks'],
                  image: const AssetImage('images/Img - 01.png'),
                );
              },
            ),
            Utils().sizedBox,
            // List for the todays test section
            const Text(
              'Today’s Tests',
              style: AppFont.kHeadingTextStyle,
            ),
            Utils().sizedBox,
            ListView.builder(
              itemCount: subjectExtraData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TopicExpansionTile(
                  heading: subjectExtraData[index]['heading'],
                  subTitle: subjectExtraData[index]['subTitle'],
                  name: subjectExtraData[index]['name'],
                  subject: subjectExtraData[index]['subject'],
                  timeAgo: subjectExtraData[index]['timeAgo'],
                  remark: subjectExtraData[index]['remark'],
                  marks: subjectExtraData[index]['marks'],
                  image: const AssetImage('images/Img - 01.png'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
