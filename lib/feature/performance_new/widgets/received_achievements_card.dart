
import 'package:flutter/cupertino.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class ReceivedAchievementsCard extends StatelessWidget {
  final String title;
  final String body;
  const ReceivedAchievementsCard({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xffF0F0D8),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppFont.kLargeTopic24TextStyle.copyWith(
                          color: AppColor.kRoseRed,
                        ),
                      ),
                      Text(
                        body,
                        style: AppFont.kBodyTextStyle.copyWith(
                          color: AppColor.kRoseRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage('images/image 48.png'),
                  ),
                  Image(
                    image: AssetImage('images/image 40.png'),
                  ),
                  Image(
                    image: AssetImage('images/image 49.png'),
                  ),
                ],
              )
            ],
          ),
          Utils(height: 20.0).sizedBox,
        ],
      ),
    );
  }
}
