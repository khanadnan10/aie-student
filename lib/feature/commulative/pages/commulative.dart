import 'package:flutter/material.dart';
import 'package:student_ui/common/common_appbar.dart';
import 'package:student_ui/utils/fonts.dart';
import 'package:student_ui/utils/utils.dart';

class Commulative extends StatefulWidget {
  const Commulative({super.key});

  @override
  State<Commulative> createState() => _CommulativeState();
}

class _CommulativeState extends State<Commulative> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        boxRequired: false,
        onIconTap: () {
          // Navigate to previous page ---------
          Navigator.pop(context);
        },
        text: 'Grade card',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Grade section ==============================================
            const Text(
              'Total Grade',
              style: AppFont.kHeadingTextStyle,
            ),
            Utils().sizedBox,
            // Pie chart representation of grades
            const Placeholder(
              fallbackHeight: 300,
              child: Center(child: Text('Pie Chart')),
            )
          ],
        ),
      ),
    );
  }
}
