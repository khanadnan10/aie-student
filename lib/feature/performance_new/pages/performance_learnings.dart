// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/widgets/feed_count_card.dart';
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
           Your feed counts
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

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: AppColor.kPurple.withOpacity(0.3),
          image:
              const DecorationImage(image: AssetImage('images/bubbles.png'))),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              //WINNER PROFILE -----------------------------------------------
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      'images/Img - 01.png',
                    ),
                    radius: 60.0,
                  ),
                  Positioned(
                    right: -5,
                    bottom: -10,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            color: AppColor.kWhite,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Image(
                          height: 40,
                          image: AssetImage(
                            'images/3d-fluency-prize 2.png',
                          ),
                        ),
                        Text(
                          '1',
                          style: AppFont.kHeadingLightTextStyle.copyWith(
                            color: AppColor.kWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Utils().sizedBox,
              //Winner Name and grades -----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Natasya Khurana',
                    style: AppFont.kHeadingTextStyle,
                  ),
                  Text(
                    '99.9',
                    style: AppFont.kHeadingTextStyle.copyWith(
                      color: AppColor.kPurple,
                    ),
                  ),
                ],
              ),
              Utils().sizedBox,
              //Runner ups card -------------
              ListView.builder(
                itemCount: leaderBoardData.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => LeaderBoardRunnerUpCard(
                    image: leaderBoardData[index]['image'],
                    rank: (index + 2).toString(),
                    name: leaderBoardData[index]['name'],
                    percent: leaderBoardData[index]['percent']),
              ),
            ],
          ),
          const Positioned(
            top: -50,
            right: 0,
            child: Image(
              height: 100,
              image: AssetImage(
                'images/handy-champion-gold-medal 1.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
