import 'package:flutter/material.dart';
import 'package:student_ui/feature/testPage/data/data.dart';
import 'package:student_ui/feature/testPage/widgets/pending_test_card.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pending Test',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pendingTest.length,
            itemBuilder: (context, index) {
              return PendingTestCard(
                subjectName: pendingTest[index]['subjectName'],
                sent: pendingTest[index]['sent'],
                marks: pendingTest[index]['marks'],
                examTitle: pendingTest[index]['examTitle'],
                totalTime: pendingTest[index]['totalTime'],
                image: pendingTest[index]['image'],
              );
            },
          ),
          const Text(
            'Pending Test',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: upcomingTest.length,
            itemBuilder: (context, index) {
              return PendingTestCard(
                subjectName: upcomingTest[index]['subjectName'],
                sent: upcomingTest[index]['sent'],
                marks: upcomingTest[index]['marks'],
                examTitle: upcomingTest[index]['examTitle'],
                totalTime: upcomingTest[index]['totalTime'],
                image: upcomingTest[index]['image'],
              );
            },
          ),
        ],
      ),
    );
  }
}
