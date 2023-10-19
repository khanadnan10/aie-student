// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/feature/commulative/data/all_subject.dart';
import 'package:student_ui/feature/commulative/widgets/achievement_message_card.dart';
import 'package:student_ui/feature/commulative/widgets/all_subject_card.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class TodayScore extends StatefulWidget {
  const TodayScore({super.key});

  @override
  State<TodayScore> createState() => _TodayScoreState();
}

class _TodayScoreState extends State<TodayScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        boxRequired: false,
        onIconTap: () {
          // Navigate to previous page ---------
          Navigator.pop(context);
        },
        text: 'Grade Card',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total Grade section ==============================================
              const Text(
                'Total Grade',
                style: AppFont.kHeadingTextStyle,
              ),
              Utils().sizedBox,
              // Pie chart representation of grades
              const Placeholder(
                fallbackHeight: 300,
                child: Center(child: Text('Pie Chart')),
              ),
              Utils().sizedBox,
              Utils().sizedBox,
              // Acheivement Message container according to the charts -----------
              const AchievementMessageCard(
                text: 'Hurray! you have excelled in maths today',
                image: AssetImage('images/image 37.png'),
              ),
              Utils().sizedBox,
              const Text(
                'Subject performance graph',
                style: AppFont.kHeadingTextStyle,
              ),
              Utils().sizedBox,
              // Line chart representation of grades
              const Placeholder(
                fallbackHeight: 200,
                child: Center(child: Text('Line Chart')),
              ),
              Utils().sizedBox,
              const Text(
                'All Subject',
                style: AppFont.kHeadingTextStyle,
              ),
              // ALL SUBJECTS --------------------------------------------------
              Utils().sizedBox,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: allSubjectData.length,
                itemBuilder: (context, index) {
                  return AllSubjectCard(
                    subject: allSubjectData[index]['subject'],
                    marks: allSubjectData[index]['marks'],
                    percent: allSubjectData[index]['percent'],
                  );
                },
              ),
              Utils().sizedBox,
              const Text(
                'Best Performance',
                style: AppFont.kHeadingTextStyle,
              ),
              // bar chart representation of grades
              Utils().sizedBox,
              const Placeholder(
                fallbackHeight: 200,
                child: Center(child: Text('bar Chart')),
              ),
              Utils().sizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
