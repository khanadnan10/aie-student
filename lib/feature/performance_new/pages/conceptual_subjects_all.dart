// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
import 'package:student_ui/feature/commulative/data/best_performance.dart';
import 'package:student_ui/feature/commulative/data/pie_data.dart';
import 'package:student_ui/feature/commulative/widgets/best_performance_bar_chart.dart';
import 'package:student_ui/feature/commulative/widgets/createLineChartBar.dart';
import 'package:student_ui/feature/commulative/widgets/performance_graph.dart';
import 'package:student_ui/feature/commulative/widgets/total_grade_pie_chart.dart';
import 'package:student_ui/feature/performance_new/widgets/column_linear_progress_card.dart';
import 'package:student_ui/feature/performance_new/widgets/time_analysis_card.dart';
import 'package:student_ui/feature/commulative/widgets/suggestion_text.dart';
import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/widgets/ai_recommendation_card.dart';
import 'package:student_ui/feature/performance_new/widgets/ai_recommendation_text_card.dart';
import 'package:student_ui/feature/performance_new/widgets/performance_filter_chip.dart';
import 'package:student_ui/feature/performance_new/widgets/performance_prediction_card.dart';
import 'package:student_ui/feature/performance_new/widgets/performance_predictor_badge_text.dart';
import 'package:student_ui/feature/performance_new/widgets/radial_gauge_card.dart';
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
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*----------------------------------------
          overall performance
          -----------------------------------------*/
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Overall performance',
                      style: AppFont.kHeadingTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '86%',
                          softWrap: true,
                          textAlign: TextAlign.start,
                          style: AppFont.kLargeTopic40TextStyle.copyWith(
                            color: AppColor.kRed,
                          ),
                        ),
                        Utils(width: 5).sizedBox,
                        Text(
                          '2.14',
                          style: AppFont.kHeadingTextStyle.copyWith(
                              color: AppColor.kGreen, letterSpacing: 1),
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
                Utils(height: 50.0).sizedBox,
                /*----------------------------------------
                All subject conceptual learning graph
                -----------------------------------------*/

                const Text(
                  'All subject conceptual learning graph',
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
                            // text: e['text'],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          /*----------------------------------------
           Recommendation text of all subject conceptual learning graph
          -----------------------------------------*/
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              const Image(
                image: AssetImage(
                  'images/image 69.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ...learningGraphTextData
                        .map(
                          (e) => RecommendationTextCard(
                            text: e,
                          ),
                        )
                        .toList(),
                  ],
                ),
              )
            ],
          ),

          /*----------------------------------------
           Performance prediction section
          -----------------------------------------*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Schoolpen grade predictor',
                    style: AppFont.kBodyTextStyle.copyWith(
                      color: AppColor.kGrey,
                    ),
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
                            itemBuilder: (context, index) =>
                                PerformancePredictorCard(
                              title: performanceSliderData[index]['title'],
                              measure: performanceSliderData[index]['measure'],
                              value: double.parse(
                                  performanceSliderData[index]['value']),
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
                      percent: aiRecommendationPerformanceCardData[index]
                          ['percent'],
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: screenSize.width * 0.8,
                              child: Performancegraph(
                                multibars: false,
                                postTouchSpot: '',
                                showTitleData: false,
                                showGridData: false,
                                commulativeLineChartBarData: [
                                  createLineChartBarData(
                                    [
                                      const FlSpot(-1.0, 1),
                                      const FlSpot(0, 1),
                                      const FlSpot(2.2, 3),
                                      const FlSpot(4.9, 5.5),
                                      const FlSpot(5.6, 5.08),
                                      const FlSpot(6.8, 4),
                                      const FlSpot(8, 4),
                                    ],
                                    AppColor.kBlue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // TODO: Do something on tap
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: AppColor.kGrey,
                              size: 26.0,
                            ),
                          ),
                        ],
                      ),
                      Utils().sizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: allTypeQuestionData.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${allTypeQuestionData[index]['text']}: ',
                                            style:
                                                AppFont.kBodyTextStyle.copyWith(
                                              color: AppColor.kGrey,
                                            ),
                                          ),
                                          TextSpan(
                                            text: allTypeQuestionData[index]
                                                ['body'],
                                            style:
                                                AppFont.kBodyTextStyle.copyWith(
                                              color: AppColor.kBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: GradientCircularProgressIndicator(
                              size: 80.0,
                              progress: 70 / // here 70 is the fake data
                                  100, // Specify the progress value in percent
                              gradient: AppColor.kReverseSkyGradient,
                              backgroundColor: Colors.grey.withOpacity(
                                  0.3), // Specify the background color
                              child: Center(
                                child: Text(
                                  '${70.toInt()}%', // Specify the progress value in percent
                                  style:
                                      AppFont.kLargeTopic24TextStyle.copyWith(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ), // Optional child widget
                            ),
                          ),
                          Utils().sizedBox,
                        ],
                      ),
                    ],
                  ),
                ),
                Utils().sizedBox,
                /*----------------------------------------
                 Accuracy section
                -----------------------------------------*/
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
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        // color: Colors.amber,
                        height: screenSize.height * 0.4,
                        width: screenSize.width,
                        child: const FittedBox(
                          fit: BoxFit.fitHeight,
                          child: RadialGaugeCard(
                            text: 'Your accuracy',
                            percent: 83,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: accuracyData.length,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${accuracyData[index]['text']}: ',
                                      style: AppFont.kBodyTextStyle.copyWith(
                                        color: AppColor.kGrey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: accuracyData[index]['body'],
                                      style: AppFont.kBodyTextStyle.copyWith(
                                        color: AppColor.kBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Utils().sizedBox,
                        ],
                      ),
                    ],
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

                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.height * 0.25,
                        width: screenSize.width,
                        child: const Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            TimeAnalysisCard(
                              timeTaken: 22.0,
                              totalTime: 30.0,
                            ),

                            // Container(
                            //   height: 10.0,
                            //   width: 15.0,
                            //   color: Colors.red,
                            // ),
                            // Container(
                            //   height: 10.0,
                            //   width: 15.0,
                            //   color: Colors.green,
                            // ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: timeAnalysisData.length,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${timeAnalysisData[index]['text']}: ',
                                      style: AppFont.kBodyTextStyle.copyWith(
                                        color: AppColor.kGrey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: timeAnalysisData[index]['body'],
                                      style: AppFont.kBodyTextStyle.copyWith(
                                        color: AppColor.kBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Utils().sizedBox,
                        ],
                      ),
                    ],
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
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage(
                          'images/Group 3936.png',
                        ),
                      ),
                      Utils().sizedBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: speedData.length - 1,
                              itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    speedData[index]['body'],
                                    style: AppFont.kBodyTextStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    speedData[index]['text'],
                                    style: AppFont.kSmallTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    speedData.last['body'],
                                    style: AppFont.kLargeTopic24TextStyle,
                                  ),
                                  Text(
                                    speedData.last['text'],
                                    style: AppFont.kSmallTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Utils().sizedBox,
                    ],
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
                        'Your performance in last ${columnLinearProgressbar.length + 1} test',
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
