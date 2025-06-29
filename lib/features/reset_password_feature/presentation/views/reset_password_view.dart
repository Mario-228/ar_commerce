import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/utils/font_styles/font_styles.dart';
import '../../../../core/widgets/custom_back_ground_container.dart';
import 'widgets/reset_password_view_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.resetPassword,
            style: FontStyles.textStyleBold22),
        centerTitle: true,
      ),
      body: CustomBackGroundContainer(
        child: ResetPasswordViewBody(email: email),
      ),
    );
  }
}
