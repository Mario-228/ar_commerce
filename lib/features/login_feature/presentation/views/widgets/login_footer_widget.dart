import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
            text: "Login", color: AppColors.darkGreen, onPressed: () {}),
        const SizedBox(height: 20.0),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Don't have an account? ",
              style: FontStyles.textStyleMedium12),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Create Account Here",
              style: FontStyles.textStyleMedium12.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.orange),
            ),
          )
        ]),
      ],
    );
  }
}
