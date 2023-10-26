// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:student_ui/feature/classwork/widgets/classwork_toggle_switch.dart';
import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/pages/subjects_all.dart';
import 'package:student_ui/feature/performance_new/widgets/grade_card_results_table.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class PerformanceAcademic extends StatefulWidget {
  const PerformanceAcademic({super.key});

  @override
  State<PerformanceAcademic> createState() => _PerformanceAcademicState();
}

class _PerformanceAcademicState extends State<PerformanceAcademic> {
  int _currentIndex = 0;
  final PageController _subjectsPageController = PageController();
  List<Widget> subjectsScreens = [
    const SubjectsAll(),
    const Center(child: Text('Maths')),
    const Center(child: Text('English')),
    const Center(child: Text('Hindi')),
    const Center(child: Text('Social Science')),
  ];

  List<String> subjectScreensText = [
    'All',
    'Maths',
    'English',
    'Hindi',
    'Social Science',
  ];

  @override
  void dispose() {
    _subjectsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Grade card',
                    style: AppFont.kHeadingTextStyle,
                  ),
                  Utils().sizedBox,
                  // Grade card for each subject----------------
                  GradeCardResultsTable(
                    subject: 'Subject',
                    isResult: false,
                    marks: gradeSubjectText,
                    gradient: AppColor.kReversePinkGradient,
                  ),
                  // -----------------------------------------------------------------------
                  // Grade card result table
                  // -----------------------------------------------------------------------
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    shrinkWrap: true,
                    itemCount: gradeSubjectTableResults.length,
                    itemBuilder: (context, index) {
                      final subjectData = gradeSubjectTableResults[index];
                      final subjectName = subjectData.keys.first;
                      final grades = subjectData[subjectName] as List<String>;
                      return GradeCardResultsTable(
                        subject: subjectName,
                        isResult: true,
                        marks: grades,
                      );
                    },
                  ),
                  //----------------------------------------
                  // Total Grade for the Grade Card
                  //----------------------------------------
                  GradeCardResultsTable(
                    subject: 'Total',
                    isResult: false,
                    marks: const ['8.8'], // Show the total grade
                    gradient: AppColor.kSkyGradient,
                  ),
                  Utils().sizedBox,
                  //----------------------------------------
                  // Subjects section
                  //----------------------------------------
                  const Text(
                    'Subjects',
                    style: AppFont.kHeadingTextStyle,
                  ),
                  Utils().sizedBox,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < subjectScreensText.length; i++)
                            screenChipToggle(
                              isSmall: true,
                              index: i,
                              currentIndex: _currentIndex,
                              text: subjectScreensText[i],
                              onTap: () {
                                setState(() {
                                  _currentIndex = i;
                                });
                                _subjectsPageController
                                    .jumpToPage(_currentIndex);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  Utils().sizedBox,

                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: PageView.builder(
                      controller: _subjectsPageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                      itemCount: subjectsScreens.length,
                      itemBuilder: (context, index) {
                        return subjectsScreens[index];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
