import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/signup_feature/presentation/views/widgets/password_field_and_strength_checker.dart';

class SignupTextFormFieldSection extends StatelessWidget {
  const SignupTextFormFieldSection({
    super.key,
    required this.passwordController,
    required this.nameController,
    required this.emailController,
  });

  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          labelText: "Full Name",
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Insert Name";
            }
            return null;
          },
        ),
        const SizedBox(height: 30.0),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: "Enter email address",
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your email';
            } else if (!(EmailValidator.validate(value))) {
              return "Insert valid email";
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 30.0),
        PasswordFieldAndStrengthChecker(passwordController: passwordController),
      ],
    );
  }
}
