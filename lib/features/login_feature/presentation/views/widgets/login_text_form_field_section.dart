import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/login_feature/presentation/views/widgets/custom_password_field_bloc_builder.dart';

class LoginTextFormFieldSection extends StatelessWidget {
  const LoginTextFormFieldSection({
    super.key,
  });
  static TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    passwordController.clear();
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: 'Enter Email Address',
          controller: TextEditingController(),
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
        const SizedBox(height: 18.0),
        CustomPasswordFieldBlocBuilder(passwordController: passwordController),
      ],
    );
  }
}
