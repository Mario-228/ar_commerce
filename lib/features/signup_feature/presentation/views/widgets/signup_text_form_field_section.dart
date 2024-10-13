import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/signup_feature/presentation/views/widgets/password_field_and_strength_checker.dart';

class SignupTextFormFieldSection extends StatelessWidget {
  const SignupTextFormFieldSection({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          labelText: "Full Name",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 30.0),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: "Enter email address",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 30.0),
        PasswordFieldAndStrengthChecker(passwordController: passwordController),
      ],
    );
  }
}
