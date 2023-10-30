import 'package:flutter/material.dart';

List<Map<String, dynamic>> speedData = [
  {
    'text': 'Total question attempted',
    'body': '580',
  },
  {
    'text': 'Time taken',
    'body': '22 min',
  },
  {
    'text': 'Average time/question',
    'body': '1 min/ques',
  },
];

List<Map<String, dynamic>> timeAnalysisData = [
  {
    'text': 'Total Test Time',
    'body': '30 min',
  },
  {
    'text': 'Time taken',
    'body': '22 min',
  },
  {
    'text': 'Average time/question',
    'body': '1 min',
  },
];
List<Map<String, dynamic>> accuracyData = [
  {
    'text': 'Total Question',
    'body': '600',
  },
  {
    'text': 'Questions attempted',
    'body': '580',
  },
  {
    'text': 'Correct answers',
    'body': '452',
  },
];
List<Map<String, dynamic>> allTypeQuestionData = [
  {
    'text': 'Total Question',
    'body': '600',
  },
  {
    'text': 'Questions attempted',
    'body': '580',
  },
  {
    'text': 'Unattempted questions',
    'body': '580',
  },
  {
    'text': 'Correct answers',
    'body': '452',
  },
  {
    'text': 'Incorrect answers',
    'body': '452',
  },
];

List<Map<String, dynamic>> leaderBoardData = [
  {
    'image': 'images/Img - 01.png',
    'name': 'Kavita Bhatia',
    'percent': '93.2',
  },
  {
    'image': 'images/Img - 01.png',
    'name': 'Kajal Bhatia',
    'percent': '92.2',
  },
  {
    'image': 'images/Img - 01.png',
    'name': 'Uttara Bhatia',
    'percent': '91.2',
  },
  {
    'image': 'images/Img - 01.png',
    'name': 'Nikita Bhatia',
    'percent': '87.2',
  },
];

List<String> suggestionTextData = [
  'Your test performance needs more effort and hardwork',
  'Practise all type of questios to improve conceptual understanding and accuracy while answering.',
];

List<String> filterChipData = [
  'All',
  'MCQ\'s',
  'FITB\'s',
  'M-MCQ\'s',
];

List<String> recommedationMessageData = [
  'Stay focused to maintain your grade',
  'Increase your accuracy to perform better, send more time in understanding the concepts',
  'Your speed is very good, maintain this and your score will never get down.',
];

List<Map<String, dynamic>> aiRecommendationPerformanceCardData = [
  {
    'list': performanceSliderData,
    'cgpa': '9.2',
    'percent': '90',
  },
  {
    'list': performanceSliderData,
    'cgpa': '9.5',
    'percent': '80',
  },
];
List<Map<String, dynamic>> performanceSliderData = [
  {
    'title': 'Activity Time',
    'text': '5',
    'measure': 'hr/day',
    'value': '42',
  },
  {
    'title': 'Accuracy',
    'text': '82',
    'measure': '%',
    'value': '42',
  },
  {
    'title': 'Speed',
    'text': '1',
    'measure': 'm/que',
    'value': '42',
  },
];

List<String> learningGraphTextData = [
  'Hurray! You are achieving heights in maths & computer',
  'You need to give more time for Hindi and English'
];
List<String> aiRecommendationData = [
  'Hurray! You are achieving heights in maths',
  'You need to pay attention to Science, your performance is droping heavily. Spent more time and notify your teacher',
];

List<Map<String, dynamic>> skillStrengthData = [
  {
    'text': 'Aptitude',
    'body': '79',
  },
  {
    'text': 'Application',
    'body': '72',
  },
  {
    'text': 'Analysis',
    'body': '65',
  },
  {
    'text': 'Memory',
    'body': '75',
  },
];

List<Map<String, dynamic>> learningMemoryData = [
  {
    'text': 'Chapter Studied',
    'body': '32',
  },
  {
    'text': 'Test Cleared',
    'body': '25',
  },
];

List<Map<String, dynamic>> columnLinearProgressbar = [
  {
    'text': 'Test 1',
    'value': 29.0,
  },
  {
    'text': 'Test 2',
    'value': 70.0,
  },
  {
    'text': 'Test 3',
    'value': 85.0,
  },
  {
    'text': 'Test 4',
    'value': 60.0,
  },
];

List<Map<String, dynamic>> statsData = [
  {
    'title': 'Total activity time',
    'body': ' 310 hours',
    'icon': Icons.access_time_filled_outlined,
  },
  {
    'title': 'Doubt Cleared',
    'body': ' 26',
    'icon': Icons.contact_support,
  },
  {
    'title': 'Test attempted',
    'body': ' 24',
    'icon': Icons.book_sharp,
  },
  {
    'title': 'Total activity time',
    'body': ' 310',
    'icon': Icons.ballot_rounded,
  },
];
List<Map<String, dynamic>> conceptualStatsData = [
  {
    'title': 'Total Topic Learnings',
    'body': ' 310 hours',
    'icon': Icons.access_time_filled_outlined,
  },
  {
    'title': 'Concept clarification',
    'body': ' 26',
    'icon': Icons.contact_support,
  },
  {
    'title': 'Practice Test',
    'body': ' 24',
    'icon': Icons.book_sharp,
  },
  {
    'title': 'Competitive Ques',
    'body': ' 310',
    'icon': Icons.ballot_rounded,
  },
];
List<Map<String, dynamic>> learningStatsData = [
  {
    'title': 'Learning Time',
    'body': ' 310 hours',
    'icon': Icons.access_time_filled_outlined,
  },
  {
    'title': 'Feed Count',
    'body': ' 26',
    'icon': Icons.feed,
  },
  {
    'title': 'Daily Rewards',
    'body': ' 24',
    'icon': Icons.emoji_events,
  },
  {
    'title': 'Competitive Ques',
    'body': ' 310',
    'icon': Icons.chrome_reader_mode_rounded,
  },
];

// ======================================================
List<String> gradeSubjectText = [
  'UT1',
  'MT',
  'UT2',
  'FT',
];

List gradeSubjectTableResults = [
  {
    'Science': [
      '8.2',
      '8.0',
      '7.2',
      '9.4',
    ],
  },
  {
    'Maths': [
      '8.2',
      '8.0',
      '7.2',
      '9.4',
    ],
  },
  {
    'English': [
      '8.2',
      '8.0',
      '7.2',
      '9.4',
    ],
  },
  {
    'Hindi': [
      '8.2',
      '8.0',
      '7.2',
      '9.4',
    ],
  },
  {
    'Social Science': [
      '8.2',
      '8.0',
      '7.2',
      '9.4',
    ],
  },
];
