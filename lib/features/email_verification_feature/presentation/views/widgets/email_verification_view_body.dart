import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_images/app_images.dart';
import 'custom_otp_form_field.dart';
import 'resend_code_verification_custom_button.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 20.0),
                    CustomOtpFormField(),
                    SizedBox(height: 20.0),
                    ResendCodeVerificationCustomButton(),
                  ],
                ),
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
