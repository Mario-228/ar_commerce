import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/reset_password_feature/presentation/views_models/reset_password_cubit/reset_password_cubit.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class ResetPasswordStrengthChecker extends StatefulWidget {
  const ResetPasswordStrengthChecker({
    super.key,
  });
  @override
  State<ResetPasswordStrengthChecker> createState() =>
      _ResetPasswordStrengthCheckerState();
}

class _ResetPasswordStrengthCheckerState
    extends State<ResetPasswordStrengthChecker> {
  bool isVisible = true;
  IconData eye = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    return PasswordStrengthFormChecker(
      onChanged: (password, notifier) {
        notifier.value = PasswordStrength.calculate(text: password);
      },
      textFormFieldConfiguration: TextFormFieldConfiguration(
        obscureText: isVisible,
        controller: ResetPasswordCubit.get(context).passwordController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          labelText: "Enter New Password",
          labelStyle:
              FontStyles.textStyleLight13.copyWith(fontWeight: FontWeight.w400),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
                if (isVisible) {
                  eye = Icons.visibility_off;
                } else {
                  eye = Icons.visibility;
                }
              });
            },
            icon: Icon(eye),
          ),
        ),
      ),
      minimumStrengthRequired: PasswordStrength.strong,
    );
  }
}
