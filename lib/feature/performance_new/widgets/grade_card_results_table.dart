
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class GradeCardResultsTable extends StatelessWidget {
  const GradeCardResultsTable({
    Key? key,
    required this.subject,
    this.gradient,
    required this.isResult,
    required this.marks,
  }) : super(key: key);

  final String subject;
  final Gradient? gradient;
  final bool isResult;
  final List<String> marks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: isResult == true ? AppColor.kGrey.withOpacity(0.4) : null,
        gradient: isResult == false ? gradient : null,
      ),
      child: Row(
        children: [
          Utils(width: 8).sizedBox,
          Expanded(
            flex: 1,
            child: Text(
              subject,
              textAlign: TextAlign.center,
              style: AppFont.kHeadingTextStyle.copyWith(
                fontSize: isResult == true ? 12.0 : 16.0,
                color: isResult == true ? AppColor.kBlack : AppColor.kWhite,
              ),
            ),
          ),
          Utils(width: 8)
              .sizedBox, // Extra space for seperation in between subjects -----
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: marks
                  .map(
                    (e) => Text(
                      e,
                      textAlign: TextAlign.center,
                      style: AppFont.kBodyTextStyle.copyWith(
                        color:
                            isResult == true ? AppColor.kGrey : AppColor.kWhite,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
