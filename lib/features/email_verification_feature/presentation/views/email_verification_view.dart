import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/core/widgets/custom_back_ground_container.dart';
import 'package:graduation_project/features/email_verification_feature/presentation/views/widgets/email_verification_view_body.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackGroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          title: const Text("Email Verification",
              style: FontStyles.textStyleBold22),
          centerTitle: true,
          backgroundColor: AppColors.transparent,
        ),
        body: const EmailVerificationViewBody(),
      ),
    );
  }
}
