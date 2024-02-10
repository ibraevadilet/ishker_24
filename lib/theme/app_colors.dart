import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color esiMainBlueColor = Color(0xff1560BD);
  static const Color color4479BABlue = Color(0xff4479BA);
  static const Color color617796Grey = Color(0xff617796);
  static const Color color727D8DGrey = Color(0xff727D8D);
  static const Color color36424BGrey = Color(0xff36424B);
  static const Color color6B7583Grey = Color(0xff6B7583);
  static const Color color7A7A7AGrey = Color(0xff7A7A7A);
  static const Color colorD0D0D0Grey = Color(0xffD0D0D0);
  static const Color colorFF0000Red = Color(0xffFF0000);
  static const Color color54B25AMain = Color(0xff54B25A);
  static const Color color1EA31EGreen = Color(0xff1EA31E);
  static const Color color34C759Green = Color(0xff34C759);
  static const Color backgroundColor = Color(0xffFAFAFA);
  static const LinearGradient billGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffBBD9B9),
      color54B25AMain,
    ],
  );
  static const LinearGradient goldCardGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffE3D0A9),
      Color(0xffCF9931),
    ],
  );
}
