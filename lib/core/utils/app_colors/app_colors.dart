import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkBrown = Color(0xFF472B29);
  static const Color darkGreen = Color(0xFF284F49);
  static const Color beige = Color(0xFFF2F0E0);
  static const Color orange = Color(0xFFE68314);
  static const Color offWhite = Color(0xFFFAFAFA);
  static const Color babyBlue = Color(0xFFCCD8D6);
  static const Color oliveGreen = Color(0xFF495A57);
  static const Color limeGreen = Color(0xFF88AE45);
  static const Color grey = Color(0xFF808080);
  static Color linearWhite = Color.lerp(
      Colors.white.withOpacity(0.87), Colors.white.withOpacity(0.93), 0.5)!;
  static const Color lightPink = Color(0xFFFFE4C7);
  static const Color darkGreenWithOpacity = Color.fromRGBO(7, 77, 66, 0.75);
  static const Color blueGrey = Color(0xFF78A0CF);
  static const Color lightGreen = Color(0xFFBFEC6F);
  static const Color lightGrey = Color(0xFFE1E0D8);
}
