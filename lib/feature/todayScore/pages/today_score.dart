import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/feature/commulative/data/best_performance.dart';
import 'package:student_ui/feature/commulative/data/pie_data.dart';
import 'package:student_ui/feature/commulative/widgets/achievement_message_card.dart';
import 'package:student_ui/feature/commulative/widgets/best_performance_bar_chart.dart';
import 'package:student_ui/feature/commulative/widgets/total_grade_pie_chart.dart';
import 'package:student_ui/feature/todayScore/data/data.dart';
import 'package:student_ui/feature/todayScore/widgets/all_subject_card.dart';
import 'package:student_ui/utils/colors.dart';
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
    final Size screenSize = MediaQuery.of(context).size;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Grade",
                    style: AppFont.kHeadingTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '82%',
                        softWrap: true,
                        textAlign: TextAlign.start,
                        style: AppFont.kLargeTopic40TextStyle.copyWith(
                          color: AppColor.kRed,
                        ),
                      ),
                      Utils(width: 5).sizedBox,
                      Text(
                        '2.14',
                        style: AppFont.kHeadingTextStyle
                            .copyWith(color: AppColor.kGreen, letterSpacing: 1),
                      ),
                      const Icon(
                        Icons.arrow_upward_rounded,
                        color: AppColor.kGreen,
                        size: 20.0,
                      )
                    ],
                  ),
                ],
              ),
              Utils().sizedBox,
              // Pie chart representation of grades
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                // Change the piechart values here -----------------------------
                child: TotalGradeChart(
                    sections: PieData.data
                        .asMap()
                        .map<int, PieChartSectionData>((index, data) {
                          final value = PieChartSectionData(
                            color: data.color,
                            value: data.percent,
                            title: '${data.percent.toInt()}',
                            radius: data.percent.toInt() > 100
                                ? data.percent - 20
                                : data.percent,
                            titleStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                          return MapEntry(index, value);
                        })
                        .values
                        .toList()),
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
                'All Subject',
                style: AppFont.kHeadingTextStyle,
              ),
              // ALL SUBJECTS --------------------------------------------------
              Utils().sizedBox,
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: todayScoreData.length,
                itemBuilder: (context, index) {
                  return AllSubjectGradeCard(
                    subject: todayScoreData[index]['subject'],
                    marks: todayScoreData[index]['marks'],
                    assignment: todayScoreData[index]['assignment'],
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
              Container(
                height: screenSize.height * 0.3,
                // width: screenSize.width,
                decoration: BoxDecoration(
                  color: const Color(0xffEBE4F5).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: bestPerformance
                      .map(
                        (e) => BestPerformanceBarChart(
                          isVisible: false,
                          gradient: e['gradient'],
                          percent: e['percent'],
                          text: e['text'],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
