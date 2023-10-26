import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_ui/feature/performance_new/pages/performance.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        useMaterial3: true,
      ),
      home: const Performance(), // Commulative --------------------------------
    );
  }
}
