import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';
import 'package:graduation_project/features/email_verification_feature/presentation/views/widgets/custom_otp_form_field.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo_implementation.dart';

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

    // const Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 10.0),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         SizedBox(height: 20.0),
    //         CustomOtpFormField(),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class ResendCodeVerificationCustomButton extends StatelessWidget {
  const ResendCodeVerificationCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
        text: "Resend Code",
        color: AppColors.darkGreen,
        onPressed: () async {
          var response =
              await SignUpRepoImplementation().sendVerificationEmail(userEmail);
          response.fold(
            (error) => showSnackBar(
                context, "Something went wrong please try again later ..."),
            (value) => showSnackBar(context, "Code sent"),
          );
        });
  }
}
