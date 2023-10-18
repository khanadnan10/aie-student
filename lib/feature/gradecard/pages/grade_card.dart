import 'package:flutter/material.dart';
import 'package:student_ui/feature/gradecard/data/data.dart';
import 'package:student_ui/feature/gradecard/widgets/grade_small_card.dart';
import 'package:student_ui/feature/gradecard/widgets/teacher_remark_card.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class GradeCard extends StatefulWidget {
  const GradeCard({super.key});

  @override
  State<GradeCard> createState() => _GradeCardState();
}

class _GradeCardState extends State<GradeCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: gradeCardData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final colorIndex = (index % gradientColor.length);
              return GradeSmallCard(
                gradient: gradientColor[
                    colorIndex], // Using the gradient index so it can select colors on random basis
                topic: gradeCardData[index]['topic'],
                percent: gradeCardData[index]['percent'],
                perRate: gradeCardData[index]['perRate'],
              );
            },
          ),

          // TEACHERS REMARKS --------------------------------------------------
          const Text(
            "Teacher’s Remarks",
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: teachersRemarkData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TeachersRemarkCard(
                image: 'images/Img - 01.png',
                name: teachersRemarkData[index]['name'],
                subject: teachersRemarkData[index]['subject'],
                timeAgo: teachersRemarkData[index]['timeAgo'],
                remark: teachersRemarkData[index]['remark'],
              );
            },
          ),
        ],
      ),
    );
  }
}
