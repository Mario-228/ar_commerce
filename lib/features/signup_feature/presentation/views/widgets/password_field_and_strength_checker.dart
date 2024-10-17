import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class PasswordFieldAndStrengthChecker extends StatefulWidget {
  const PasswordFieldAndStrengthChecker({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordFieldAndStrengthChecker> createState() =>
      _PasswordFieldAndStrengthCheckerState();
}

class _PasswordFieldAndStrengthCheckerState
    extends State<PasswordFieldAndStrengthChecker> {
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
        controller: widget.passwordController,
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
