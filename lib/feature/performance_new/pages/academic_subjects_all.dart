// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:student_ui/feature/commulative/data/pie_data.dart';
import 'package:student_ui/feature/commulative/widgets/createLineChartBar.dart';
import 'package:student_ui/feature/commulative/widgets/performance_graph.dart';
import 'package:student_ui/feature/commulative/widgets/subject_performance_graph.dart';
import 'package:student_ui/feature/performance_new/widgets/radial_gauge_card.dart';
import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/widgets/ai_recommendation_text_card.dart';
import 'package:student_ui/feature/performance_new/widgets/column_linear_progress_card.dart';
import 'package:student_ui/feature/performance_new/widgets/learning_memory.dart';
import 'package:student_ui/feature/performance_new/widgets/skills_strength_card.dart';
import 'package:student_ui/feature/performance_new/widgets/stats_card.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class AcademicSubjectsAll extends StatefulWidget {
  const AcademicSubjectsAll({super.key});

  @override
  State<AcademicSubjectsAll> createState() => _AcademicSubjectsAllState();
}

class _AcademicSubjectsAllState extends State<AcademicSubjectsAll> {
  List<String> items = [
    '24 hours',
    '1 week',
    '1 month',
    '3 month',
    'Custom',
  ];
  bool isSelected = false;
  late List<String>? selecteditem = [items.first];
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            // shrinkWrap: true,
            children: [
              Utils().sizedBox,
              Utils().sizedBox,
              Utils().sizedBox,
              /*----------------------------------------
               All subject performance graph
              -----------------------------------------*/
              SizedBox(
                height: screenSize.height * 0.2,
                child: SubjectPerformancegraph(
                  lineChartBarData: [
                    createLineChartBarData([
                      const FlSpot(-1.0, 1),
                      const FlSpot(0, 1),
                      const FlSpot(2.2, 3),
                      const FlSpot(4.9, 5),
                      const FlSpot(6.8, 3),
                      const FlSpot(8, 4),
                    ], AppColor.kBlue),
                    createLineChartBarData(
                      [
                        const FlSpot(-1, 0.2),
                        const FlSpot(1, 4),
                        const FlSpot(2.2, 2.8),
                        const FlSpot(4, 5.5),
                        const FlSpot(5, 3.8),
                        const FlSpot(6, 4.5),
                        const FlSpot(11, 4),
                      ],
                      AppColor.kYellow,
                    ),
                    createLineChartBarData(
                      [
                        const FlSpot(-1, 1.5),
                        const FlSpot(1, 4),
                        const FlSpot(2.2, 2.8),
                        const FlSpot(3.3, 3.5),
                        const FlSpot(5, 3.8),
                        const FlSpot(6.2, 6.5),
                      ],
                      AppColor.kPurple,
                    ),
                  ],
                ),
              ),
              Utils().sizedBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...PieData.data.map(
                      (data) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data.name,
                            style: AppFont.kSmallTextStyle,
                          ),
                          Utils(width: 5).sizedBox,
                          Container(
                            height: 16.0,
                            width: 16.0,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: data.color,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
              // Your activity time
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
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppColor.kPurple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...items.map(
                            (e) => GestureDetector(
                              onTap: () {
                                if (selecteditem!.contains(e)) {
                                  selecteditem!.remove(e);
                                } else {
                                  selecteditem!.clear();
                                  selecteditem!.add(e);
                                }
                                setState(() {});
                                print('selected activity time: $selecteditem');
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: selecteditem!.contains(e)
                                      ? AppColor.kPurple
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    color: selecteditem!.contains(e)
                                        ? AppColor.kWhite
                                        : AppColor.kGrey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Utils().sizedBox,
                    Performancegraph(
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
                            const FlSpot(4.9, 5),
                            const FlSpot(6.8, 3),
                            const FlSpot(8, 4),
                          ],
                          AppColor.kBlue,
                        ),
                      ],
                    ),
                  ],
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
              // Accuracy section
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
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
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
              //----------------------------------------
              // Learning Memory
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
              // Performance in homework
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
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppColor.kPurple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.book,
                      color: AppColor.kPurple,
                    ),
                    Performancegraph(
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
                            const FlSpot(4.9, 5),
                            const FlSpot(6.8, 3),
                            const FlSpot(8, 4),
                          ],
                          const Color(0xff3491FA),
                        ),
                      ],
                    ),
                    Text(
                      'Total homework',
                      style: AppFont.kBodyTextStyle.copyWith(
                        color: AppColor.kGrey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '310',
                          style: AppFont.kLargeTopic24TextStyle.copyWith(
                            color: const Color(0xff3491FA),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.kGrey,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Utils().sizedBox,
              //----------------------------------------
              //  Performance in test
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
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppColor.kPurple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.book,
                      color: AppColor.kPurple,
                    ),
                    Performancegraph(
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
                            const FlSpot(4.9, 5),
                            const FlSpot(6.8, 3),
                            const FlSpot(8, 4),
                          ],
                          const Color(0xff3491FA),
                        ),
                      ],
                    ),
                    Text(
                      'Total homework',
                      style: AppFont.kBodyTextStyle.copyWith(
                        color: AppColor.kGrey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '310',
                          style: AppFont.kLargeTopic24TextStyle.copyWith(
                            color: const Color(0xff3491FA),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColor.kGrey,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ],
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
          )
        ],
      ),
    );
  }
}
