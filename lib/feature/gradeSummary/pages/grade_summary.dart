import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/common/common_floating_button.dart';
import 'package:student_ui/common/enum.dart';
import 'package:student_ui/feature/commulative/data/suggestion.dart';
import 'package:student_ui/feature/commulative/widgets/score_small_card.dart';
import 'package:student_ui/feature/commulative/widgets/suggestion_text.dart';
import 'package:student_ui/feature/commulative/widgets/total_grade_gradient_text.dart';
import 'package:student_ui/feature/commulative/widgets/type_indicator.dart';
import 'package:student_ui/feature/gradeSummary/data/data.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class GradeSummary extends StatefulWidget {
  const GradeSummary({super.key});

  @override
  State<GradeSummary> createState() => _GradeSummaryState();
}

class _GradeSummaryState extends State<GradeSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        leadingColor: AppColor.kPurple,
        boxRequired: false,
        onIconTap: () {
          // Navigate to previous page ---------
          Navigator.pop(context);
        },
        centerTitle: 'Grade Summary',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils().sizedBox,
              //Header for text, image and total score
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Score',
                    style: AppFont.kHeadingTextStyle,
                  ),
                  Image(
                    image: AssetImage(
                      'images/bonbon-smiling-boy-holding-a-victory-cup 1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  TotalGradeGradientText(
                    marksObtained: '8',
                    outOfMarks: '10',
                  ),
                ],
              ),
              Utils().sizedBox,
              //Score small card
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: scoreData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ScoreSmallCard(
                    scoreCardType: ScoreCard.icon,
                    gradient: AppColor.kPinkGradient,
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 40.0,
                      color: AppColor.kWhite,
                    ),
                    title: scoreData[index]['title'],
                    subTitle: 'View Answer Key',
                    onTap: () {
                      //TODO: View answer key for the score card summary
                    },
                  );
                },
              ),
              Utils().sizedBox,
              // Performace % ---------------------------------------
              const Text(
                'Performace %',
                style: AppFont.kHeadingTextStyle,
              ),
              Text(
                'Check your performace % on this homework',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Circular progress bar -----------------------------------
                  Flexible(
                    child: GradientCircularProgressIndicator(
                      size: 100.0,
                      progress: performancePercentage /
                          100, // Specify the progress value in percent
                      gradient: AppColor.kReverseSkyGradient,
                      backgroundColor: Colors.grey
                          .withOpacity(0.3), // Specify the background color
                      child: Center(
                        child: Text(
                          '${performancePercentage.toInt()}%',
                          style: AppFont.kLargeTopic24TextStyle.copyWith(
                            fontSize: 32.0,
                          ),
                        ),
                      ), // Optional child widget
                    ),
                  ),
                  // Details for the circular bar -----------------------------------
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: performancePercentageData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: TypeIndicator(
                            count: performancePercentageData[index]['count'],
                            text: performancePercentageData[index]['text'],
                            indicationColor: (performancePercentageData[index]
                                        ['text'])
                                    .toString()
                                    .contains(
                                        'Obtained') // If the marks is of obtainer marks then the colored should be changed to blue for indication
                                ? const Color(0xff1D7DE7)
                                : AppColor.kGrey.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Utils().sizedBox,
              // Your efficiency---------------------------------------
              const Text(
                'Your efficiency',
                style: AppFont.kHeadingTextStyle,
              ),
              Text(
                'Time analysis for each attempt',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Circular progress bar -----------------------------------
                  const Flexible(
                    child: SizedBox(
                      height: 120.0,
                      child: Image(
                        image: AssetImage('images/business-3d-red-clock 1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Details for the efficiency bar ----------------------------
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: yourEfficiencyData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: TypeIndicator(
                            includeColor: IncludeColor.no,
                            count:
                                '${yourEfficiencyData[index]['count'] + ' min'}',
                            text: '${yourEfficiencyData[index]['text']}',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Utils().sizedBox,
              // Accuracy --------------------------------------
              const Text(
                'Accuracy',
                style: AppFont.kHeadingTextStyle,
              ),
              Text(
                'Shows percentage of questions answered correctly',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset('images/Group 3401.svg'),
                      Text(
                        '80',
                        style: AppFont.kHeadingTextStyle.copyWith(
                          color: AppColor.kWhite,
                        ),
                      )
                    ],
                  ),
                  Utils().sizedBox,
                  //Accuracy text and question ---------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Attempted question : ',
                              style: AppFont.kBodyTextStyle.copyWith(
                                color: AppColor.kGrey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '10', // total question -----------------------
                              style: AppFont.kBodyTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Correct answer : ',
                            style: AppFont.kBodyTextStyle.copyWith(
                              color: AppColor.kGrey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '8', // total question -----------------------
                            style: AppFont.kBodyTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Utils().sizedBox,
              // Suggestions ---------------------------------------
              const Text(
                'Suggestions',
                style: AppFont.kHeadingTextStyle,
              ),
              Text(
                'Personalised suggestions based on your report ',
                style: AppFont.kBodyTextStyle.copyWith(color: AppColor.kGrey),
              ),
              Utils().sizedBox,
              // showing the list of suggestions -----------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.5, // remove the sized box if new widget is added after this
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: suggestionData.length,
                  itemBuilder: (context, index) => SuggestionText(
                    text: suggestionData[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingButton(
        text: 'Learn with Tutor',
        gradient: AppColor.kReverseSkyGradient,
        onTap: () {
          //TODO: Learn with tutor functionality
        },
      ),
    );
  }
}
