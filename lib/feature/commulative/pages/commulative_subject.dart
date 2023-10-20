// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';

import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/common/common_floating_button.dart';
import 'package:student_ui/common/enum.dart';
import 'package:student_ui/feature/commulative/data/performance.dart';
import 'package:student_ui/feature/commulative/data/scoresmallcard.dart';
import 'package:student_ui/feature/commulative/data/suggestion.dart';
import 'package:student_ui/feature/commulative/widgets/createLineChartBar.dart';
import 'package:student_ui/feature/commulative/widgets/performance_graph.dart';
import 'package:student_ui/feature/commulative/widgets/score_small_card.dart';
import 'package:student_ui/feature/commulative/widgets/suggestion_text.dart';
import 'package:student_ui/feature/commulative/widgets/total_grade_gradient_text.dart';
import 'package:student_ui/feature/commulative/widgets/type_indicator.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class CommulativeSubject extends StatefulWidget {
  const CommulativeSubject({super.key});

  @override
  State<CommulativeSubject> createState() => _CommulativeSubjectState();
}

class _CommulativeSubjectState extends State<CommulativeSubject> {
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
        title: 'English',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils().sizedBox,
              //Header for text, image and total score
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Score',
                    style: AppFont.kHeadingTextStyle,
                  ),
                  Image(
                    image: AssetImage(
                      'images/bonbon-smiling-boy-holding-a-victory-cup 1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  TotalGradeGradientText(
                    outOfMarks: '200',
                    marksObtained: '180',
                  ),
                ],
              ),
              Utils().sizedBox,

              //Score small card
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: scoresmallcardData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ScoreSmallCard(
                      scoreCardType: ScoreCard.text,
                      title: scoresmallcardData[index]['title'],
                      onTap: () {
                        //TODO: Navigate to the type of score card
                      },
                      subTitle: 'View all',
                      marks: scoresmallcardData[index]['marks']);
                },
              ),
              // Performance graph -----------------------------------------------
              Utils().sizedBox,
              const Text(
                'Performance graph',
                style: AppFont.kHeadingTextStyle,
              ),
              // bar chart representation of grades
              Text(
                'Your daily performance graph',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              Performancegraph(
                commulativeLineChartBarData: [
                  createLineChartBarData([
                    const FlSpot(-1.0, 1),
                    const FlSpot(0, 1),
                    const FlSpot(2.2, 3),
                    const FlSpot(4.9, 5),
                    const FlSpot(6.8, 3),
                    const FlSpot(8, 4),
                  ], AppColor.kBlue),
                ],
              ),
              // your monthly performance graph ----------------------------------
              Utils().sizedBox,
              Text(
                'Your daily performance graph',
                style: AppFont.kBodyTextStyle.copyWith(
                  color: AppColor.kGrey,
                ),
              ),
              Utils().sizedBox,
              Performancegraph(
                commulativeLineChartBarData: [
                  createLineChartBarData([
                    const FlSpot(-1.0, 1),
                    const FlSpot(0, 1),
                    const FlSpot(2.2, 3),
                    const FlSpot(4.9, 5),
                    const FlSpot(6.8, 3),
                    const FlSpot(8, 4),
                  ], AppColor.kBlue),
                ],
              ),
              Utils().sizedBox,
              // Performace in MCQ types ---------------------------------------
              const Text(
                'Performace in MCQ types',
                style: AppFont.kHeadingTextStyle,
              ),
              Text(
                'Check your performace in MCQ based questions',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Circular progress bar -----------------------------------
                  Flexible(
                    child: GradientCircularProgressIndicator(
                      size: 100.0,
                      progress: progress1 /
                          100, // Specify the progress value in percent
                      gradient: AppColor.kReverseSkyGradient,
                      backgroundColor: Colors.grey
                          .withOpacity(0.3), // Specify the background color
                      child: Center(
                        child: Text(
                          '${progress1.toInt()}%',
                          style: AppFont.kLargeTopic24TextStyle.copyWith(
                            fontSize: 32.0,
                          ),
                        ),
                      ), // Optional child widget
                    ),
                  ),
                  // Details for thec circular bar -----------------------------------
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: performance1.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: TypeIndicator(
                            count: performance1[index]['count'],
                            text: performance1[index]['text'],
                            indicationColor: (performance1[index]['text'])
                                    .toString()
                                    .contains('answers')
                                ? const Color(0xff1D7DE7)
                                : AppColor.kGrey.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Utils().sizedBox,
              Utils().sizedBox,
              // Performace in Objective types ---------------------------------------
              const Text(
                'Performace in Objective types',
                style: AppFont.kHeadingTextStyle,
              ),
              Text(
                'Check your performace in objective based questions',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Circular progress bar -----------------------------------
                  Flexible(
                    child: GradientCircularProgressIndicator(
                      size: 100.0,
                      progress: (progress2 /
                          100), // Specify the progress value in percent
                      gradient: AppColor.kReverseSkyGradient,
                      backgroundColor: Colors.grey
                          .withOpacity(0.3), // Specify the background color
                      child: Center(
                        child: Text(
                          '${progress2.toInt()}%',
                          style: AppFont.kLargeTopic24TextStyle.copyWith(
                            fontSize: 32.0,
                          ),
                        ),
                      ), // Optional child widget
                    ),
                  ),
                  // Details for thec circular bar -----------------------------------
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: performance2.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: TypeIndicator(
                            count: performance2[index]['count'],
                            text: performance2[index]['text'],
                            indicationColor: (performance2[index]['text'])
                                    .toString()
                                    .contains('answers')
                                ? const Color(0xff1D7DE7)
                                : AppColor.kGrey.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Utils().sizedBox,
              Utils().sizedBox,
              // Suggestions ---------------------------------------
              const Text(
                'Suggestions',
                style: AppFont.kHeadingTextStyle,
              ),
              Text(
                'Personalised suggestions based on your report',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              // showing the list of suggestions -----------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.5, // remove the sized box if new widget is added after this
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: suggestionData.length,
                  itemBuilder: (context, index) => SuggestionText(
                    text: suggestionData[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingButton(
        text: 'Learn with Tutor',
        gradient: AppColor.kReverseSkyGradient,
        onTap: () {
          //TODO: Learn with tutor functionality
        },
      ),
    );
  }
}
