import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';

class CustomFooterWidget extends StatelessWidget {
  const CustomFooterWidget({
    super.key,
    required this.buttonTitle,
    required this.footerText,
    required this.footerLinkText,
    required this.onPressed,
  });
  final String buttonTitle;
  final String footerText;
  final String footerLinkText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
            text: buttonTitle, color: AppColors.darkGreen, onPressed: () {}),
        const SizedBox(height: 20.0),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(footerText, style: FontStyles.textStyleMedium12),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              footerLinkText,
              style: FontStyles.textStyleMedium12.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.orange),
            ),
          )
        ]),
      ],
    );
  }
}
