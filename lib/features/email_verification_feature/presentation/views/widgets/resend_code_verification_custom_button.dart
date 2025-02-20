import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../signup_feature/data/repo/sign_up_repo_implementation.dart';

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
