import 'package:flutter/material.dart';

class AppColor {
  static const Color kPurple = Color(0xff9163D7);
  static const Color kPurpleLight = Color(0xffF4EFFB);
  static const Color kWhite = Color(0xffffffff);
  static const Color kGrey = Color(0xff707070);
  static const Color kBlack = Color(0xff000000);
  static const Color kOceanBlue = Color(0xff44C2E1);
  static const Color kLiteGreen = Color(0xff10E888);
  static const Color kGreen = Color(0xff2EBA3C);
  static const Color kBlue = Color(0xff0066FF);
  static const Color kYellow = Color(0xffF7BA1E);
  static const Color kRed = Color(0xffF86005);

  //Gradients ============================================

  static LinearGradient kPinkGradient = const LinearGradient(colors: [
    Color(0xffF63A7D),
    Color(0xffFE786F),
  ]);
  static LinearGradient kReversePinkGradient = const LinearGradient(colors: [
    Color(0xffFE786F),
    Color(0xffF63A7D),
  ]);
  static LinearGradient kYelloGradient = const LinearGradient(colors: [
    Color(0xffFF8A00),
    Color(0xffFBD900),
  ]);
  static LinearGradient kBlueGradient = const LinearGradient(colors: [
    Color(0xff0066FF),
    Color(0xff0037FB),
  ]);
  static LinearGradient kSkyGradient = const LinearGradient(colors: [
    Color(0xff52BAFC),
    Color(0xff1D7DE7),
  ]);
  static LinearGradient kReverseSkyGradient = const LinearGradient(colors: [
    Color(0xff1D7DE7),
    Color(0xff52BAFC),
  ]);
  static LinearGradient kOceanGradient = const LinearGradient(colors: [
    Color(0xff44C2E1),
    Color(0xff89F5FE),
  ]);
  static LinearGradient kPurpleGradient = const LinearGradient(colors: [
    Color(0xff9866CF),
    Color(0xff7253F6),
  ]);

// top to bottom
  static LinearGradient kPinkGradienttop = const LinearGradient(
    colors: [
      Color(0xffFE786F),
      Color(0xffF63A7D),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient kReversePinkGradienttop = const LinearGradient(
    colors: [
      Color(0xffF63A7D),
      Color(0xffFE786F),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient kSkyGradientTop = LinearGradient(
    colors: [
      const Color(0xff52BAFC),
      const Color(0xff52BAFC).withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient kYelloGradienttop = LinearGradient(
    colors: [
      const Color(0xffFBD900),
      const Color(0xffFBD900).withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient kBlueGradienttop = LinearGradient(
    colors: [
      const Color(0xff0037FB),
      const Color(0xff0066FF).withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient ktealGradienttop = LinearGradient(
    colors: [
      const Color(0xff14C9C9),
      const Color(0xff0066FF).withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient kPurpleGradienttop = LinearGradient(
    colors: [
      const Color(0xff722ED1),
      const Color(0xff722ED1).withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient kGreenGradienttop = LinearGradient(
    colors: [
      const Color(0xff9FDB1D),
      const Color(0xff9FDB1D).withOpacity(0.3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
