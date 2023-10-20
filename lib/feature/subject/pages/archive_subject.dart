// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/feature/classwork/data/data.dart';
import 'package:student_ui/feature/classwork/widgets/funtion_chip_menu.dart';
import 'package:student_ui/feature/classwork/widgets/simple_chip.dart';
import 'package:student_ui/feature/subject/data/data.dart';
import 'package:student_ui/feature/subject/widgets/topic_expansion_tile.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class ArchiveSubject extends StatefulWidget {
  const ArchiveSubject({super.key});

  @override
  State<ArchiveSubject> createState() => _ArchiveSubjectState();
}

class _ArchiveSubjectState extends State<ArchiveSubject> {
  String? _sortByValue;
  String? _filterValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        onIconTap: () {
          // Navigating to previous page
          Navigator.pop(context);
        },
        boxRequired: true,
        gradient: AppColor.kReverseSkyGradient,
        isBackgroundImage: true,
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
              'Archive homeworks',
              style: AppFont.kHeadingTextStyle,
            ),
            Utils().sizedBox, 
            _submittedHomeworkMenuItems(),
            Utils().sizedBox,
            ListView.builder(
              itemCount: subjectExtraData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TopicExpansionTile(
                  gradient: AppColor.kReverseSkyGradient,
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
          ],
        ),
      ),
    );
  }

// Show menu items in the list of the subject extra items
  Widget _submittedHomeworkMenuItems() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FunctionChip(
            // Sort by chip
            items: dropDownList,
            onChanged: (value) {
              setState(() {
                _sortByValue = value;
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            hintText: _sortByValue ?? 'Sort by',
          ),
          Utils(width: 10.0).sizedBox,
          FunctionChip(
            // Filter by chip
            items: const ['some'],
            onChanged: (value) {
              setState(() {
                _filterValue = value;
              });
            },
            icon: const Icon(
              Icons.tune,
              size: 20.0,
            ),
            hintText: _filterValue ?? 'Filter ',
          ),
          Utils(width: 10.0).sizedBox,
          SimpleTextChip(
            text: 'MCQ',
            onTap: () {
              //MCQ Filter here
            },
          ),
          Utils(width: 10.0).sizedBox,
          SimpleTextChip(
            text: "FITB’s",
            onTap: () {
              //FITB Filter here
            },
          ),
        ],
      ),
    );
  }
}
