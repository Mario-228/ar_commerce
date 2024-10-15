import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class PasswordFieldAndStrengthChecker extends StatelessWidget {
  const PasswordFieldAndStrengthChecker({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return PasswordStrengthFormChecker(
      onChanged: (password, notifier) {
        notifier.value = PasswordStrength.calculate(text: password);
      },
      textFormFieldConfiguration: TextFormFieldConfiguration(
        controller: passwordController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          labelText: "Password",
          labelStyle:
              FontStyles.textStyleLight13.copyWith(fontWeight: FontWeight.w400),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.visibility_off),
          ),
        ),
      ),
      minimumStrengthRequired: PasswordStrength.strong,
    );
  }
}
