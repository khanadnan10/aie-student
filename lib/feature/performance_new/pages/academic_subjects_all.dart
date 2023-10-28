// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/widgets/ai_recommendation_text_card.dart';
import 'package:student_ui/feature/performance_new/widgets/column_linear_progress_card.dart';
import 'package:student_ui/feature/performance_new/widgets/learning_memory.dart';
import 'package:student_ui/feature/performance_new/widgets/skills_strength_card.dart';
import 'package:student_ui/feature/performance_new/widgets/stats_card.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class AcademicSubjectsAll extends StatelessWidget {
  const AcademicSubjectsAll({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            'Stats',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          SizedBox(
            height: 170,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 70,
              ),
              itemCount: statsData.length,
              itemBuilder: (context, index) {
                return StatsCard(
                  icon: statsData[index]['icon'],
                  title: statsData[index]['title'],
                  body: statsData[index]['body'],
                );
              },
            ),
          ),
          //----------------------------------------
          // TODO: Your activity time
          //----------------------------------------
          const Text(
            'Your activity Time',
            style: AppFont.kHeadingTextStyle,
          ),
          Text(
            'Your daily Time spent on App graph',
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Utils().sizedBox,
          Row(
            children: [
              const Flexible(
                child: Image(
                  height: 70.0,
                  image: AssetImage(
                    'images/business-3d-red-clock 1.png',
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Learning Time: ',
                          style: AppFont.kHeadingTextStyle.copyWith(
                            color: AppColor.kGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '324 hours 23 min',
                          style: AppFont.kHeadingTextStyle.copyWith(
                            color: AppColor.kBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Since 21 Oct 2022',
                    style: AppFont.kSmallTextStyle,
                  )
                ],
              )
            ],
          ),
          Utils().sizedBox,
          //----------------------------------------
          // TODO: Accuracy
          //----------------------------------------
          const Text(
            'Accuracy',
            style: AppFont.kHeadingTextStyle,
          ),
          Text(
            'Shows percentage of questions answered correctly',
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Utils().sizedBox,
          //----------------------------------------
          // TODO: Learning Memory
          //----------------------------------------
          const Text(
            'Learning Memory',
            style: AppFont.kHeadingTextStyle,
          ),
          Text(
            'Shows percentage of concept remembered',
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Utils().sizedBox,
          LearningMemory(
            listData: learningMemoryData,
          ), // TODO: Change the card with data
          //----------------------------------------
          // TODO: Performance in homework
          //----------------------------------------
          Utils().sizedBox,
          const Text(
            'Performance in homework',
            style: AppFont.kHeadingTextStyle,
          ),
          Text(
            'Your performance record in homeworks based on time acuuracy and speed',
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Utils().sizedBox,
          //----------------------------------------
          // TODO: Performance in test
          //----------------------------------------
          const Text(
            'Performance in Test',
            style: AppFont.kHeadingTextStyle,
          ),
          Text(
            'Your performance record in homeworks based on time acuuracy and speed',
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Utils().sizedBox,
          // TODO: area chart
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: AppColor.kPurple.withOpacity(0.3),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Test Results',
                  style: AppFont.kBodyTextStyle.copyWith(
                    color: AppColor.kGrey,
                  ),
                ),
                Text(
                  '85% (548/600)',
                  style: AppFont.kLargeTopic24TextStyle.copyWith(
                    color: AppColor.kGrey,
                  ),
                ),
                Text(
                  'Test Results',
                  style: AppFont.kSmallTextStyle.copyWith(
                    color: AppColor.kGrey,
                  ),
                ),
                // Test progress bar in column -----------------------------------
                ...columnLinearProgressbar.map(
                  (e) => ColumnLinearProgressbar(
                    text: e['text'],
                    value: e['value'],
                  ),
                ),
              ],
            ),
          ),
          Utils().sizedBox,
          //----------------------------------------
          // Skills strength
          //----------------------------------------
          const Text(
            'Skills Strength',
            style: AppFont.kHeadingTextStyle,
          ),
          Text(
            'Based on your performance in homeworks and test',
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Utils().sizedBox,
          SkillsStrengthCard(
            screenSize: screenSize,
            list: skillStrengthData,
          ),
          Utils().sizedBox,
          const Text(
            'AI Recommedation',
            style: AppFont.kHeadingTextStyle,
          ),
          Text(
            'Shows areas for improvment',
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Utils().sizedBox,
          ListView.builder(
            itemCount: aiRecommendationData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => RecommendationTextCard(
              text: aiRecommendationData[index],
            ),
          ),
          Utils().sizedBox,
          Utils().sizedBox,
          Utils().sizedBox,
          Utils().sizedBox,
        ],
      ),
    );
  }
}
