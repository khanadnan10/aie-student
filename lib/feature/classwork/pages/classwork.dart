import 'package:flutter/material.dart';
import 'package:student_ui/feature/classwork/pages/homework.dart';
import 'package:student_ui/feature/classwork/widgets/classwork_appbar.dart';
import 'package:student_ui/feature/classwork/widgets/classwork_toggle_switch.dart';
import 'package:student_ui/feature/testPage/pages/test.dart';
import 'package:student_ui/utils/colors.dart';

class Classwork extends StatefulWidget {
  const Classwork({super.key});

  @override
  State<Classwork> createState() => _ClassworkState();
}

class _ClassworkState extends State<Classwork> {
  int _currentIndex = 0;
  final PageController _classworkPageController = PageController();
  List<Widget> classworkScreens = [
    const Homework(),
    const Test(),
    const Center(child: Text('Gradecard')),
  ];

  @override
  void dispose() {
    _classworkPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: ClassworkAppbar(
        onTap: () {
          //Leading icon - *Drawer
        },
        onSearch: () {
          //On search tap
        },
        onMessage: () {
          //onMessage tap
        },
        onNotification: () {
          //onNotification tap
        },
        image: 'images/Group 3860.png',
        profileImage: 'images/Img - 01.png',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
          bottom: 0,
        ),
        child: Column(
          children: [
            // Toggle of homework, exams, gradecard -----------
            Container(
              padding: const EdgeInsets.all(2.0),
              margin: const EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                color: AppColor.kPurpleLight,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ClassworkToggleSwitch(
                      index: 0,
                      currentIndex: _currentIndex,
                      text: 'Homework',
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                        _classworkPageController.jumpToPage(_currentIndex);
                      },
                    ),
                  ),
                  Expanded(
                    child: ClassworkToggleSwitch(
                      index: 1,
                      currentIndex: _currentIndex,
                      text: 'Test',
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                        _classworkPageController.jumpToPage(_currentIndex);
                      },
                    ),
                  ),
                  Expanded(
                    child: ClassworkToggleSwitch(
                      index: 2,
                      currentIndex: _currentIndex,
                      text: 'Gradecard',
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                        _classworkPageController.jumpToPage(_currentIndex);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _classworkPageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemCount: classworkScreens.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: classworkScreens[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
