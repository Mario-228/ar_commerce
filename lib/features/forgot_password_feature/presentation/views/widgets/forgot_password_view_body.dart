import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_images/app_images.dart';
import 'forgot_password_body_content.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ForgotPasswordBodyContent(),
              ),
              Opacity(
                opacity: 0.3,
                child: SvgPicture.asset(
                  AppImages.assetsImagesLockIcon,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
