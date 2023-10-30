// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:student_ui/feature/commulative/widgets/createLineChartBar.dart';
import 'package:student_ui/feature/commulative/widgets/performance_graph.dart';
import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/widgets/feed_count_card.dart';
import 'package:student_ui/feature/performance_new/widgets/leaderboard_card.dart';
import 'package:student_ui/feature/performance_new/widgets/leaderboard_runner_up_card.dart';
import 'package:student_ui/feature/performance_new/widgets/received_achievements_card.dart';
import 'package:student_ui/feature/performance_new/widgets/stats_card.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class PerformanceLearnings extends StatefulWidget {
  const PerformanceLearnings({super.key});

  @override
  State<PerformanceLearnings> createState() => _PerformanceLearningsState();
}

class _PerformanceLearningsState extends State<PerformanceLearnings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
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
          Utils(height: 32.0).sizedBox,
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                width: 2.0,
                color: AppColor.kPurple,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.kYellow,
                              blurRadius: 100,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        top: -45,
                        child: Image(
                          image: AssetImage('images/3d-fluency-prize 2.png'),
                          // height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '35000 points',
                  style: AppFont.kLargeTopic24TextStyle.copyWith(
                    color: const Color.fromARGB(255, 90, 66, 2),
                  ),
                ),
              ],
            ),
          ),
          Utils().sizedBox,
          /*----------------------------------------
           Received achievements section
          -----------------------------------------*/
          const Text(
            'Received Achievements',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => const ReceivedAchievementsCard(
              title: 'Mega Quiz Competition winner',
              body: 'Among 400 participants',
            ),
          ),
          Utils().sizedBox,
          /*----------------------------------------
           Leaderboard section
          -----------------------------------------*/
          const Text(
            'Leaderboard',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          const LeaderboardCard(), // Extracted Widgets --------------
          Utils().sizedBox,
          /*----------------------------------------
            Reading count
          -----------------------------------------*/
          LeaderboardGraphCards(
            heading: 'Total homework',
            body: '310 Articles',
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
                    const FlSpot(4.9, 5),
                    const FlSpot(6.8, 3),
                    const FlSpot(8, 4),
                  ],
                  AppColor.kBlue,
                ),
              ],
            ),
          ),
          Utils().sizedBox,
          /*----------------------------------------
           learning the graph
          -----------------------------------------*/
          LeaderboardGraphCards(
            heading: 'Your learning time grapgh',
            body: '310 hours',
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
                    const FlSpot(4.9, 5),
                    const FlSpot(6.8, 3),
                    const FlSpot(8, 4),
                  ],
                  AppColor.kBlue,
                ),
              ],
            ),
          ),
          Utils().sizedBox,
          /*----------------------------------------
           TODO: Your feed counts
          -----------------------------------------*/
          const FeedCountCard(
            title: 'Your feed counts',
            comment:
                'Total number of feeds you have been posted and shared with your circle',
            count: '216',
            upstream: '12',
          ),
          Utils().sizedBox,
        ],
      ),
    );
  }
}

class LeaderboardGraphCards extends StatelessWidget {
  final Widget child;
  final String heading;
  final String body;
  const LeaderboardGraphCards({
    Key? key,
    required this.child,
    required this.heading,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColor.kPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: AppFont.kBodyTextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          Text(
            body,
            style: AppFont.kLargeTopic24TextStyle.copyWith(
              color: AppColor.kGrey,
            ),
          ),
          child // For the Extra Information related to the graph
        ],
      ),
    );
  }
}
