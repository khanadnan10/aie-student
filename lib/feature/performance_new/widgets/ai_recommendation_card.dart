import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class AiRecommendationPerformanceCard extends StatelessWidget {
  final List<Map<String, dynamic>> list;
  final String percent;
  final String cgpa;
  const AiRecommendationPerformanceCard({
    Key? key,
    required this.list,
    required this.percent,
    required this.cgpa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: AppColor.kPurple.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils(width: 25.0).sizedBox,
              ...list.asMap().entries.map(
                (e) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${e.value['text']} ${e.value['measure']}',
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: AppColor.kGrey),
                          ),
                          e.value['measure'] ==
                                  '%' // Condition check for the percentage symbol
                              ? const RotatedBox(
                                  quarterTurns: 3,
                                  child: Icon(
                                    Icons.arrow_right_alt_outlined,
                                    color: AppColor.kGreen,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Text(
                        e.value['title'],
                        style: AppFont.kSmallTextStyle
                            .copyWith(color: AppColor.kGrey),
                      ),
                    ],
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kPurple.withOpacity(0.5),
                ),
                child: Text(
                  cgpa, //CGPA DATA
                  style: AppFont.kHeadingTextStyle.copyWith(
                    color: AppColor.kGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: -0,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: AppColor.kPurple,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: AppColor.kWhite,
              ),
            ),
            child: Text(
              '$percent%',
              style: AppFont.kHeadingTextStyle.copyWith(
                color: AppColor.kWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
