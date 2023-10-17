import 'package:flutter/material.dart';
import 'package:student_ui/feature/classwork/data/data.dart';
import 'package:student_ui/feature/classwork/widgets/funtion_chip_menu.dart';
import 'package:student_ui/feature/classwork/widgets/homework_card.dart';
import 'package:student_ui/feature/classwork/widgets/resume_homework.dart';
import 'package:student_ui/feature/classwork/widgets/simple_chip.dart';
import 'package:student_ui/feature/classwork/widgets/submitted_homework_card.dart';
import 'package:student_ui/feature/classwork/widgets/topics_card.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class Science extends StatefulWidget {
  const Science({super.key});

  @override
  State<Science> createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  String? _sortByValue;
  String? _filterValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pending Homework',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          // Pending Homework ----------------------------------------------------
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: pendingHomework.length,
              itemBuilder: (context, index) {
                return HomeworkCard(
                  subjectName: pendingHomework[index]['subjectName'],
                  sent: pendingHomework[index]['sent'],
                  homeworkTitle: pendingHomework[index]['homeworkTitle'],
                  homeworkbody: pendingHomework[index]['homeworkbody'],
                  image: const AssetImage(
                    'images/taxi-407 1.png',
                  ),
                );
              },
            ),
          ),
          const Text(
            'Resume Homework',
            style: AppFont.kHeadingTextStyle,
          ),
          // Utils().sizedBox,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            // width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: PageController(),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: resumeHomework.length,
              itemBuilder: (context, index) {
                return ResumeHomeworkCard(
                  onTap: () {
                    // TODO: Resume/Continue playing the video for the choosen homework
                  },
                  subjectName: resumeHomework[index]['subjectName'],
                  sent: resumeHomework[index]['sent'],
                  percent: resumeHomework[index]['percent'],
                  homeworkTitle: resumeHomework[index]['homeworkTitle'],
                  homeworkbody: resumeHomework[index]['homeworkbody'],
                  image: const AssetImage(
                    'images/taxi-407 1.png',
                  ),
                );
              },
            ),
          ),
          // RESUME HOMEWORK ENDS HERE -----------------------------------------
          // AI RECOMMENDED TOPIC STARTS----------------------------------------------
          const Text(
            'AI recommended topics',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return TopicsCard(
                    subjectName: topics[index]['subjectName'],
                    onTap: () {
                      //TODO: TOPICS on TAP
                    },
                    homeworkTitle: topics[index]['homeworkTitle']);
              },
            ),
          ),
          // AI RECOMMENDED TOPIC ENDS ----------------------------------------------
          Utils().sizedBox,
          // Practice Similar Concepts STARTS----------------------------------------------
          const Text(
            'Practice Similar Concepts',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          MediaQuery.removePadding(
            context: context,
            removeRight: true,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: practiceConcepts.length,
                itemBuilder: (context, index) {
                  return TopicsCard(
                    subjectName: practiceConcepts[index]['subjectName'],
                    onTap: () {
                      //TODO: Practice Concepts onTAp
                    },
                    homeworkTitle: practiceConcepts[index]['homeworkTitle'],
                  );
                },
              ),
            ),
          ),
          // Practice Similar Concepts ENDS ------------------------------------
          Utils().sizedBox,
          // Submitted Homeworks -----------------------------------------------
          const Text(
            'Submitted Homeworks',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          _submittedHomeworkMenuItems(), // Menu Items of the submitted homework
          Utils().sizedBox,
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: submittedHomework.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: SubmittedHomeworkCard(
                    subjectName: submittedHomework[index]['subjectName'],
                    sent: submittedHomework[index]['sent'],
                    marks: submittedHomework[index]['marks'],
                    homeworkTitle: submittedHomework[index]['homeworkTitle'],
                    homeworkbody: submittedHomework[index]['homeworkbody'],
                    image: const AssetImage(
                      'images/taxi-407 1.png',
                    ),
                  ),
                );
              },
            ),
          ),
          // PAGE ENDS ---------------------------------------------------------
        ],
      ),
    );
  }

// ======================= METHODS =============================================
// Menu items for the submitted homeworks --------------------------------------
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
