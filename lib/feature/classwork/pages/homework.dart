import 'package:flutter/material.dart';
import 'package:student_ui/feature/classwork/pages/sub-pages/science.dart';
import 'package:student_ui/feature/classwork/widgets/classwork_toggle_switch.dart';

class Homework extends StatefulWidget {
  const Homework({super.key});

  @override
  State<Homework> createState() => _HomeworkState();
}

class _HomeworkState extends State<Homework> {
  int _currentIndex = 0;
  final PageController _homeworkPageController = PageController();
  List<Widget> homeworkScreens = [
    const Science(),
    const Center(child: Text('Maths')),
    const Center(child: Text('English')),
    const Center(child: Text('Hindi')),
    const Center(child: Text('Social Science')),
  ];

  List<String> homeworkToggleScreens = [
    'Science',
    'Maths',
    'English',
    'Hindi',
    'Social Science',
  ];

  @override
  void dispose() {
    _homeworkPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Toggle of homework, exams, gradecard -----------
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
                for (int i = 0; i < homeworkToggleScreens.length; i++)
                  ClassworkToggleSwitch(
                    isSmall: true,
                    index: i,
                    currentIndex: _currentIndex,
                    text: homeworkToggleScreens[i],
                    onTap: () {
                      setState(() {
                        _currentIndex = i;
                      });
                      _homeworkPageController.jumpToPage(_currentIndex);
                    },
                  ),
              ],
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _homeworkPageController,
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            itemCount: homeworkScreens.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: homeworkScreens[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
