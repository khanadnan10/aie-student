// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/common/common_floating_button.dart';
import 'package:student_ui/common/common_title_body_text.dart';
import 'package:student_ui/feature/homeworktype/data/data.dart';
import 'package:student_ui/feature/homeworktype/widgets/GradeAssignmentOutOfCard.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class TestInstruction extends StatefulWidget {
  const TestInstruction({super.key});

  @override
  State<TestInstruction> createState() => _TestInstructionState();
}

class _TestInstructionState extends State<TestInstruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: CommonAppbar(
        title: 'Science',
        subTitle: 'Homework',
        // Image resized to its capable length: Boxfit.cover
        image: const AssetImage(
          'images/juicy-young-man-looks-at-his-watch-during-an-exam 1.png',
        ),
        gradient: AppColor.kOceanGradient,
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
                'September Exam',
                style: AppFont.kTopicTextStyle,
              ),
              Utils().sizedBox,
              const Text(
                'Submit by',
                style: AppFont.kHeadingTextStyle,
              ),
              Utils().sizedBox,
              Text(
                '14/09/2022 at 10:00 PM',
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
                      fromCount: '90',
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
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) => CommonTitleBodyText(
                  title: aboutHomework[index]['title'],
                  body: aboutHomework[index]['body'],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CommonFloatingButton(
        text: 'Start Test',
        gradient: AppColor.kOceanGradient,
        onTap: () {
          // Add your action here
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
