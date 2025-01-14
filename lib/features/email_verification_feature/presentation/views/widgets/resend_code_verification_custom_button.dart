import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo_implementation.dart';

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
