import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';

abstract class FontStyles {
  static const TextStyle textStyleLight10 = TextStyle(
    color: AppColors.black,
    fontSize: 10,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w300,
  );
  static const TextStyle textStyleMedium12 = TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleLight13 = TextStyle(
    color: AppColors.black,
    fontSize: 13,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w300,
  );
  static const TextStyle textStyleMeduim13 = TextStyle(
    color: AppColors.grey,
    fontSize: 13,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleRegular14 = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w400,
    height: 0.08,
    letterSpacing: -0.17,
  );
  // static const TextStyle textStyleSemiBold15 = TextStyle(
  //   color: AppColors.black,
  //   fontSize: 15,
  //   fontFamily: 'SF Pro Text',
  //   fontWeight: FontWeight.w600,
  //   height: 0.08,
  //   letterSpacing: -0.17,
  // );
  static const TextStyle textStyleSemiBold15 = TextStyle(
    color: AppColors.darkGreen,
    fontSize: 15,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textStyleBold16 = TextStyle(
    color: AppColors.beige,
    fontSize: 16,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle textStyleBold20 = TextStyle(
    color: AppColors.grey,
    fontSize: 20,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle textStyleBold28 = TextStyle(
    color: AppColors.darkGreen,
    fontSize: 28,
    fontFamily: 'Lufga',
    fontWeight: FontWeight.w700,
  );
}
