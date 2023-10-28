// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:student_ui/feature/commulative/widgets/suggestion_text.dart';

import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/widgets/ai_recommendation_card.dart';
import 'package:student_ui/feature/performance_new/widgets/ai_recommendation_text_card.dart';
import 'package:student_ui/feature/performance_new/widgets/performance_filter_chip.dart';
import 'package:student_ui/feature/performance_new/widgets/performance_prediction_card.dart';
import 'package:student_ui/feature/performance_new/widgets/performance_predictor_badge_text.dart';
import 'package:student_ui/feature/performance_new/widgets/stats_card.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class ConceptualSubjectsAll extends StatefulWidget {
  const ConceptualSubjectsAll({super.key});

  @override
  State<ConceptualSubjectsAll> createState() => _ConceptualSubjectsAllState();
}

class _ConceptualSubjectsAllState extends State<ConceptualSubjectsAll> {
  double value = 30.0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      // shrinkWrap: true,
      children: [
        /*----------------------------------------
         TODO: overall performance
        -----------------------------------------*/
        /*----------------------------------------
         TODO: All subject conceptual learning graph
        -----------------------------------------*/
        /*----------------------------------------
         Recommendation text of all subject conceptual learning graph
        -----------------------------------------*/
        ...learningGraphTextData
            .map(
              (e) => RecommendationTextCard(
                text: e,
              ),
            )
            .toList(),

        /*----------------------------------------
         Performance prediction section
        -----------------------------------------*/
        const Text(
          'Performance prediction',
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          'Spen performance prediction to match  your goals ',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils().sizedBox,
        const PerformancePredictorBadgeText(
          currentPerformance: '86',
          currentGrade: '8.8',
          icon: Icons.military_tech_outlined,
        ),
        Utils(height: 10.0).sizedBox,
        Text(
          'Schoolpen grade predictor',
          textAlign: TextAlign.center,
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils(height: 10.0).sizedBox,

        // performance grade predictor scale -----

        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppColor.kPurple.withOpacity(0.2),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Performance card ----------------------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils().sizedBox,
                  Utils().sizedBox,
                  Text(
                    'Performance',
                    style: AppFont.kHeadingTextStyle.copyWith(
                      color: AppColor.kGrey,
                    ),
                  ),
                  Utils().sizedBox,
                  // showing the slider here ---------------
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: performanceSliderData.length,
                    itemBuilder: (context, index) => PerformancePredictorCard(
                      title: performanceSliderData[index]['title'],
                      measure: performanceSliderData[index]['measure'],
                      value:
                          double.parse(performanceSliderData[index]['value']),
                      screenSize: screenSize,
                    ),
                  ),
                ],
              ),
              Positioned(
                right: -12,
                top: -25,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPurple,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '86%',
                        style: AppFont.kHeadingTextStyle.copyWith(
                          color: AppColor.kWhite,
                        ),
                      ),
                      Utils(width: 10.0).sizedBox,
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.kPurpleLight.withOpacity(0.5),
                        ),
                        child: Text(
                          '8.8',
                          style: AppFont.kHeadingTextStyle.copyWith(
                            color: AppColor.kGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         AI Recommendation
        -----------------------------------------*/
        const Text(
          'Performance prediction',
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          'Spen performance prediction to match  your goals ',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils().sizedBox,
        //Ai recommendation card
        ListView.builder(
          shrinkWrap: true,
          itemCount: aiRecommendationPerformanceCardData.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: AiRecommendationPerformanceCard(
              list: aiRecommendationPerformanceCardData[index]['list'],
              cgpa: aiRecommendationPerformanceCardData[index]['cgpa'],
              percent: aiRecommendationPerformanceCardData[index]['percent'],
            ),
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         Message for the ai recommendation
        -----------------------------------------*/
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: AppColor.kPurple.withOpacity(0.2),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: recommedationMessageData
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         Stats section
        -----------------------------------------*/
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
            itemCount: learningStatsData.length,
            itemBuilder: (context, index) {
              return StatsCard(
                icon: learningStatsData[index]['icon'],
                title: learningStatsData[index]['title'],
                body: learningStatsData[index]['body'],
              );
            },
          ),
        ),
        Utils().sizedBox,
        const Text(
          'Performance in types of question',
          style: AppFont.kHeadingTextStyle,
        ),
        SizedBox(
          height: screenSize.height * 0.1,
          child: PerformanceFilterChip(
            item: filterChipData,
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         Performance in tall types of questions
        -----------------------------------------*/
        const Text(
          'Performace in all types of question',
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          'Check your performace in each questions types',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         Accuracy
        -----------------------------------------*/
        const Text(
          'Accuracy',
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          'Show percentage of questions answered correctly',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         Time analysis
        -----------------------------------------*/
        const Text(
          'Time analysis',
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          'Time taken to attempt each questions',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         Speed
        -----------------------------------------*/
        const Text(
          'Speed',
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          'Your speed in attempting questions correctly',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         Performance in practice test
        -----------------------------------------*/
        const Text(
          'Performance in practice test',
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          'Show overall test results',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils().sizedBox,
        /*----------------------------------------
         Suggestions
        -----------------------------------------*/
        const Text(
          'Suggestions',
          style: AppFont.kHeadingTextStyle,
        ),
        Text(
          'Personalised suggestions based on your report',
          style: AppFont.kBodyTextStyle.copyWith(
            color: AppColor.kGrey,
          ),
        ),
        Utils().sizedBox,
        ListView.builder(
          shrinkWrap: true,
          itemCount: suggestionTextData.length,
          itemBuilder: (context, index) => SuggestionText(
            text: suggestionTextData[index],
          ),
        )
      ],
    );
  }
}
