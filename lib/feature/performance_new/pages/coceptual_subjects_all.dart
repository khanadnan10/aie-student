// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/widgets/ai_recommendation_text_card.dart';
import 'package:student_ui/feature/performance_new/widgets/performance_prediction_card.dart';
import 'package:student_ui/feature/performance_new/widgets/performance_predictor_badge_text.dart';
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
            color: AppColor.kPurple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Stack(
            children: [
              // Performance card ----------------------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'widget.title',
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
            ],
          ),
        )
      ],
    );
  }
}
