
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class SkillsStrengthCard extends StatelessWidget {
  final Size screenSize;
  final List<Map<String, dynamic>> list;
  const SkillsStrengthCard({
    Key? key,
    required this.screenSize,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColor.kPurple.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: [
          ...list.map(
            (e) {
              final value = int.parse(e.values.last);

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      e.entries.first.value,
                      style: AppFont.kBodyTextStyle.copyWith(
                        color: AppColor.kGrey,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${value.toString()}%',
                          style: AppFont.kSmallTextStyle.copyWith(
                            color: AppColor.kGrey,
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.5,
                          child: LinearProgressIndicator(
                            value: value / 100,
                            minHeight: 8.0,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ).toList()
        ],
      ),
    );
  }
}
