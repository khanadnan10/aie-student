import 'package:flutter/material.dart';
import 'package:student_ui/feature/classwork/widgets/classwork_toggle_switch.dart';
import 'package:student_ui/feature/performance_new/pages/coceptual_subjects_all.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class PerformanceConceptual extends StatefulWidget {
  const PerformanceConceptual({super.key});

  @override
  State<PerformanceConceptual> createState() => _PerformanceConceptualState();
}

class _PerformanceConceptualState extends State<PerformanceConceptual> {
  int _currentIdxConceptual = 0;
  final PageController _conceptualPageController = PageController();
  List<Widget> conceptualSubjectsScreens = [
    const ConceptualSubjectsAll(),
    const ConceptualSubjectsAll(),
    const ConceptualSubjectsAll(),
    const ConceptualSubjectsAll(),
    const ConceptualSubjectsAll(),
    // const Center(child: Text('Maths')),
    // const Center(child: Text('English')),
    // const Center(child: Text('Hindi')),
    // const Center(child: Text('Social Science')),
  ];

  List<String> conceptualSubjectsScreensText = [
    'All',
    'Maths',
    'English',
    'Hindi',
    'Social Science',
  ];

  @override
  void dispose() {
    _conceptualPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          const Text(
            'Subjects',
            style: AppFont.kHeadingTextStyle,
          ),
          Utils().sizedBox,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < conceptualSubjectsScreensText.length; i++)
                    screenChipToggle(
                      isSmall: true,
                      index: i,
                      currentIndex: _currentIdxConceptual,
                      text: conceptualSubjectsScreensText[i],
                      onTap: () {
                        setState(() {
                          _currentIdxConceptual = i;
                        });
                        _conceptualPageController
                            .jumpToPage(_currentIdxConceptual);
                      },
                    ),
                ],
              ),
            ),
          ),
          Utils().sizedBox,
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              controller: _conceptualPageController,
              onPageChanged: (value) {
                setState(() {
                  _currentIdxConceptual = value;
                });
              },
              itemCount: conceptualSubjectsScreens.length,
              itemBuilder: (context, index) {
                return conceptualSubjectsScreens[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
