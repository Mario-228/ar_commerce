import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(
          height: 40.0,
          width: 85.0,
          image: AssetImage(AppImages.assetsImagesLogo),
        ),
        SizedBox(height: 65.0),
        Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: FontStyles.textStyleBold28,
        ),
        SizedBox(height: 7.0),
        Text(
          'Login to your minifurs account',
          style: FontStyles.textStyleRegular14,
        ),
      ],
    );
  }
}
