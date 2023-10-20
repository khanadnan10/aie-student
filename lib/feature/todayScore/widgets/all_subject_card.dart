import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class AllSubjectGradeCard extends StatefulWidget {
  final String subject;
  final String marks;
  final List<String>
      assignment; // TODO: Add the list type later according to the dynamic list

  const AllSubjectGradeCard({
    Key? key,
    required this.subject,
    required this.marks,
    required this.assignment,
  }) : super(key: key);

  @override
  State<AllSubjectGradeCard> createState() => _AllSubjectGradeCardState();
}

class _AllSubjectGradeCardState extends State<AllSubjectGradeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26.0),
      decoration: BoxDecoration(
        gradient: AppColor.kPinkGradient,
        borderRadius: BorderRadius.circular(24.0),
        image: const DecorationImage(
          image: AssetImage('images/image 34.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.subject,
            style: AppFont.kHeadingLightTextStyle.copyWith(
              color: AppColor.kWhite,
            ),
          ),
          Text(
            '${widget.marks}/20',
            style: AppFont.kLargeTopic24TextStyle.copyWith(
              color: AppColor.kWhite,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.assignment.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(
                    'Assignment ${index + 1}',
                    style: AppFont.kBodyTextStyle.copyWith(
                      color: AppColor.kWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Utils(width: 10).sizedBox,
                  Text(
                    '${widget.assignment[index]}/10',
                    style: AppFont.kBodyTextStyle.copyWith(
                      color: AppColor.kWhite,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
