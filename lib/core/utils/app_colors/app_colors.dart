import 'package:flutter/material.dart';

abstract class AppColors {
  //white
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFFAFAFA);
  static const Color whiteShade800 = Color(0xFFF0F0F0);
  static const Color whiteShade700 = Color(0xFFE5E5E5);
  static Color linearWhite = Color.lerp(
      Colors.white.withOpacity(0.87), Colors.white.withOpacity(0.93), 0.5)!;

  //green
  static const Color darkGreen = Color(0xFF284F49);
  static const Color oliveGreen = Color(0xFF495A57);
  static const Color limeGreen = Color(0xFF88AE45);
  static const Color darkGreenWithOpacity = Color.fromRGBO(7, 77, 66, 0.75);
  static const Color lightGreen = Color(0xFFBFEC6F);

  //blue
  static const Color babyBlue = Color(0xFFCCD8D6);
  static const Color blueGrey = Color(0xFF78A0CF);

  //grey
  static const Color grey = Color(0xFFAAAAAA);
  static const Color greyShade800 = Color(0xFF909090);
  static const Color lightGrey = Color(0xFFE1E0D8);
  static const Color darkGrey = Color(0xFF808080);
  static const Color greyShade700 = Color(0xFF606060);
  static const Color greyShade600 = Color(0xFFDEDEDE);

  //black
  static const Color black = Color(0xFF000000);
  static const Color blackShade800 = Color(0xFF121212);
  static const Color blackShade700WithOpacity = Color.fromRGBO(32, 32, 32, 0.1);

  //orange
  static const Color glodenOrange = Color(0xFFE29547);
  static const Color orange = Color(0xFFE68314);

  //others
  static const Color darkBrown = Color(0xFF472B29);
  static const Color beige = Color(0xFFF2F0E0);
  static const Color lightPink = Color(0xFFFFE4C7);
  static const Color transparent = Colors.transparent;
  static const Color red = Colors.red;
}
