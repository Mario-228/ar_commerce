import 'package:flutter/material.dart';
import '../../../../core/utils/font_styles/font_styles.dart';
import '../../../../core/widgets/custom_back_ground_container.dart';
import 'widgets/email_verification_view_body.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Email Verification", style: FontStyles.textStyleBold22),
        centerTitle: true,
        //backgroundColor: AppColors.transparent,
      ),
      body: const CustomBackGroundContainer(
        child: SafeArea(
          bottom: false,
          child: EmailVerificationViewBody(),
        ),
      ),
    );
  }
}
