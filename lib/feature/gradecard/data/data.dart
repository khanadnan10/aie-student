import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';

List<Map<String, dynamic>> gradeCardData = [
  {
    'topic': "Today's Grade",
    'percent': '86',
    'perRate': '2.14',
  },
  {
    'topic': "Commulative Grade",
    'percent': '86',
    'perRate': '2.14',
  },
];
List<Map<String, dynamic>> teachersRemarkData = [
  {
    'name': 'Neetu Kapoor',
    'subject': 'Science',
    'timeAgo': '4 hour ago',
    'remark':
        'Bring practical notebook to the class, we will conduct some experiments tomorrow.',
  },
  {
    'name': 'Tanya Mittal',
    'subject': 'Physics',
    'timeAgo': '2 hour ago',
    'remark':
        'Bring practical notebook to the class, we will conduct some experiments tomorrow.',
  },
  {
    'name': 'Amy Gaur',
    'subject': 'English',
    'timeAgo': '2 hour ago',
    'remark':
        'You have to focus on your grammer, context is very good but lacks the way you write your answers.',
  },
];

//TODO:  This can be used in production as well - Only for the gradient use
List<Gradient> gradientColor = [
  AppColor.kPinkGradient,
  AppColor.kReverseSkyGradient,
];
