import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';

class PasswordResetViewBody extends StatelessWidget {
  const PasswordResetViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Image(
              height: 40.0,
              width: 85.0,
              image: AssetImage(AppImages.assetsImagesLogo),
            ),
          ),
          const SizedBox(height: 65.0),
          const Image(
            alignment: Alignment.center,
            height: 210,
            width: 210,
            image: AssetImage(AppImages.assetsImagesEmailImage),
          ),
          Text(
            "Please check your email to \n reset password",
            textAlign: TextAlign.center,
            style: FontStyles.textStyleBold16.copyWith(
                color: AppColors.darkGreen, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 40.0),
          CustomMaterialButton(
              text: "Back to Login",
              color: AppColors.darkGreen,
              onPressed: () => GoRouter.of(context).push(AppRouters.kLoginView),
              textColor: AppColors.white),
        ],
      ),
    );
  }
}
