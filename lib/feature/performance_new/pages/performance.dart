import 'package:flutter/material.dart';
import 'package:student_ui/feature/classwork/widgets/classwork_toggle_switch.dart';
import 'package:student_ui/feature/performance_new/pages/performance_academic.dart';
import 'package:student_ui/utils/colors.dart';

class Performance extends StatefulWidget {
  const Performance({super.key});

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  int _currentIndexPerformance = 0;
  final PageController _performancePageController = PageController();
  List<Widget> performanceScreens = [
    const PerformanceAcademic(),
    const Center(
      child: Text('Conceptual'),
    ),
    const Center(
      child: Text('Learnings'),
    ),
  ];

  List<String> performanceScreenText = [
    'Academic',
    'Conceptual',
    'Learnings',
  ];

  @override
  void dispose() {
    _performancePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO: Drawer for the app ----------------
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0),
            image: const DecorationImage(
              image: AssetImage(
                'images/Group 3860performance_top_background.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        toolbarHeight: kToolbarHeight + 50,
        actions: const [
          Image(
            height: kToolbarHeight + 30,
            image: AssetImage(
              'images/bonbon-smiling-boy-holding-a-victory-cup 1.png',
            ),
            fit: BoxFit.cover,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              margin: const EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                color: AppColor.kPurpleLight,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < performanceScreenText.length; i++)
                    Expanded(
                      child: screenChipToggle(
                        index: i,
                        currentIndex: _currentIndexPerformance,
                        text: performanceScreenText[i],
                        onTap: () {
                          setState(() {
                            _currentIndexPerformance = i;
                          });
                          _performancePageController
                              .jumpToPage(_currentIndexPerformance);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _performancePageController,
              onPageChanged: (value) {
                setState(() {
                  _currentIndexPerformance = value;
                });
              },
              itemCount: performanceScreens.length,
              itemBuilder: (context, index) {
                return performanceScreens[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
