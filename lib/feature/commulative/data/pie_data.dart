import 'package:flutter/material.dart';

class Data {
  final String name;
  final double percent;
  final Color color;

  Data({required this.name, required this.percent, required this.color});
}

class PieData {
  static List<Data> data = [
    Data(name: 'English', percent: 75, color: const Color(0xff165DFF)),
    Data(name: 'Hindi', percent: 78, color: const Color(0xff14C9C9)),
    Data(name: 'Science', percent: 69, color: const Color(0xffF7BA1E)),
    Data(name: 'Maths', percent: 55, color: const Color(0xff722ED1)),
    Data(name: 'Social Science', percent: 50, color: const Color(0xff3491FA)),
    Data(name: 'Computer', percent: 24, color: const Color(0xff9FDB1D)),
  ];
}
