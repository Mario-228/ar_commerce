import 'package:flutter/material.dart';
import '../utils/font_styles/font_styles.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {super.key,
      required this.text,
      required this.color,
      this.onPressed,
      this.textColor,
      this.height = 50.0});
  final String text;
  final Color color;
  final void Function()? onPressed;
  final Color? textColor;
  final double height;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: double.infinity,
        onPressed: onPressed,
        color: color,
        height: height,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Text(
          text,
          style: FontStyles.textStyleBold16.copyWith(color: textColor),
        ));
  }
}
