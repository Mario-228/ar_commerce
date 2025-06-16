import 'package:flutter/material.dart';
import '../../../../core/utils/font_styles/font_styles.dart';
import '../../../../core/widgets/custom_back_ground_container.dart';
import 'widgets/email_verification_view_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.emailVerification,
            style: FontStyles.textStyleBold22),
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
