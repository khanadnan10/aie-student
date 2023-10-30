import 'package:flutter/material.dart';
import 'package:student_ui/feature/performance_new/data/data.dart';
import 'package:student_ui/feature/performance_new/widgets/leaderboard_runner_up_card.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

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
