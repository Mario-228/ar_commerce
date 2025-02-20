import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../core/utils/font_styles/font_styles.dart';

class ProfileCustomButton extends StatelessWidget {
  const ProfileCustomButton({
    super.key,
    required this.text,
    required this.color,
    this.onPressed,
    this.textColor,
    this.height = 50.0,
    this.radius = 7.0,
    this.width = double.infinity,
  });
  final String text;
  final Color color;
  final void Function()? onPressed;
  final Color? textColor;
  final double height;
  final double radius;
  final double width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: width,
        onPressed: onPressed,
        color: color,
        height: height,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.logout, color: AppColors.lightLimeGreen),
            const SizedBox(width: 10.0),
            Text(
              text,
              style: FontStyles.textStyleMostBold18,
            ),
          ],
        ));
  }
}
