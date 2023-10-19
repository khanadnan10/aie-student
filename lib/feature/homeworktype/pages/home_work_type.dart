// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/common/common_floating_button.dart';
import 'package:student_ui/common/common_title_body_text.dart';
import 'package:student_ui/feature/homeworktype/data/data.dart';
import 'package:student_ui/feature/homeworktype/widgets/GradeAssignmentOutOfCard.dart';
import 'package:student_ui/feature/homeworktype/widgets/short_info_card.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class HomeworkType extends StatefulWidget {
  const HomeworkType({super.key});

  @override
  State<HomeworkType> createState() => _HomeworkTypeState();
}

class _HomeworkTypeState extends State<HomeworkType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: CommonAppbar(
        gradient: AppColor.kReverseSkyGradient,
        title: 'Science',
        subTitle: 'Homework',
        image: const AssetImage('images/pablo-education 1grading_work_img.png'),
        onIconTap: () {
          Navigator.pop(context);
          //TODO: Leading Icon action ---
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils().sizedBox,
              const Text(
                'Sent by',
                style: AppFont.kHeadingTextStyle,
              ),
              Utils().sizedBox,
              ShortInfoCard(
                title: 'John Doe',
                role: 'Arts | Primary',
                image: 'images/Img - 01.png',
                onCall: () {
                  //TODO: On call functionality
                },
                onMessage: () {
                  //TODO: On message functionality
                },
              ),
              Utils().sizedBox,
              const Text(
                'Digestive system',
                style: AppFont.kTopicTextStyle,
              ),
              Utils().sizedBox,
              const Text(
                'Deadline',
                style: AppFont.kHeadingTextStyle,
              ),
              Utils().sizedBox,
              Text(
                '14/09/2022 at 11:59 PM',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColor.kOceanBlue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GradeAssignmentOutOfCard(
                      fromCount: '30',
                      format: 'min',
                      icon: Icon(
                        Icons.access_time_filled,
                        color: AppColor.kWhite,
                      ),
                    ),
                    GradeAssignmentOutOfCard(
                      fromCount: '10',
                      format: 'ques',
                      icon: Icon(
                        Icons.question_mark_rounded,
                        color: AppColor.kWhite,
                      ),
                    ),
                    GradeAssignmentOutOfCard(
                      fromCount: '30',
                      format: 'm.m',
                      icon: Icon(
                        Icons.star_rounded,
                        color: AppColor.kWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Utils().sizedBox,
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: aboutHomework.length,
                  itemBuilder: (context, index) => CommonTitleBodyText(
                    title: aboutHomework[index]['title'],
                    body: aboutHomework[index]['body'],
                  ),
                ),
              ),
              // Utils().sizedBox,
            ],
          ),
        ),
      ),
      floatingActionButton: CommonFloatingButton(
        text: 'Resume Homework',
        gradient: AppColor.kSkyGradient,
        onTap: () {
          // Add your action here
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
