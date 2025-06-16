import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../signup_feature/data/repo/sign_up_repo_implementation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResendCodeVerificationCustomButton extends StatelessWidget {
  const ResendCodeVerificationCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
      text: AppLocalizations.of(context)!.resendCode,
      color: AppColors.darkGreen,
      onPressed: () async {
        var response =
            await SignUpRepoImplementation().sendVerificationEmail(userEmail);
        response.fold(
          (error) => showSnackBar(
              context, AppLocalizations.of(context)!.somethingWentWrong),
          (value) =>
              showSnackBar(context, AppLocalizations.of(context)!.codeSent),
        );
      },
    );
  }
}
