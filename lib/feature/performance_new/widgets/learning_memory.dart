// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class LearningMemory extends StatelessWidget {
  final List listData;
  const LearningMemory({
    Key? key,
    required this.listData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColor.kPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage(
                  'images/image 50.png',
                ),
              ),
              Utils(width: 5).sizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...listData.map(
                    (e) => RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${e.entries.first.value}: ',
                            style: AppFont.kBodyTextStyle.copyWith(
                              color: AppColor.kGrey,
                            ),
                          ),
                          TextSpan(
                            text: e.entries.last.value,
                            style: AppFont.kBodyTextStyle.copyWith(
                              color: AppColor.kBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '56.8%',
            style: AppFont.kLargeTopic24TextStyle.copyWith(
              color: const Color(0xff20A686),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
