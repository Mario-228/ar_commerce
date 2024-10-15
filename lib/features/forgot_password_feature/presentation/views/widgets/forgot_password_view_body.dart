import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/features/forgot_password_feature/presentation/views/widgets/forgot_password_body_content.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ForgotPasswordBodyContent(),
          ),
        ),
        Opacity(
          opacity: 0.3,
          child: SvgPicture.asset(
            AppImages.assetsImagesLockIcon,
          ),
        ),
      ],
    );
  }
}
