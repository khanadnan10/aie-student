import 'package:flutter/material.dart';

class Utils {
  final double height;
  final double width;
  Utils({
    this.height = 16.0,
    this.width = 0.0,
  });
  SizedBox get sizedBox => SizedBox(
        height: height,
        width: width,
      );
}