import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_ui/feature/homeworktype/pages/home_work_type.dart';
import 'package:student_ui/feature/testInstruction/pages/test_instruction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
     debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
    useMaterial3: true,
    ),
    home: const TestInstruction(),
  );
  }
}
