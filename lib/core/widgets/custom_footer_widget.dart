import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import '../utils/app_colors/app_colors.dart';
import '../utils/font_styles/font_styles.dart';
import 'custom_material_button.dart';

class CustomFooterWidget extends StatelessWidget {
  const CustomFooterWidget({
    super.key,
    required this.buttonTitle,
    required this.footerText,
    required this.footerLinkText,
    required this.onPressedButton,
    required this.onPressedFooterText,
  });
  final String buttonTitle;
  final String footerText;
  final String footerLinkText;
  final void Function() onPressedButton;
  final void Function() onPressedFooterText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
            text: buttonTitle,
            color: AppColors.darkGreen,
            //this function must passed in constructor
            onPressed: onPressedButton),
        const SizedBox(height: 20.0),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(footerText, style: FontStyles.textStyleMedium12),
            GestureDetector(
              onTap: onPressedFooterText,
              child: Text(
                footerLinkText,
                style: FontStyles.textStyleMedium12.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.orange),
              ),
            )
          ]),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
