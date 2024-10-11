import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';

class LoginTextFormFieldSection extends StatelessWidget {
  const LoginTextFormFieldSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: 'Enter Email Address',
          controller: TextEditingController(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your email';
            }
            return null;
          },
        ),
        const SizedBox(height: 18.0),
        CustomTextFormField(
          isPassword: true,
          type: TextInputType.emailAddress,
          labelText: 'Password',
          controller: TextEditingController(),
          icon: Icons.visibility_off,
          onPressed: () {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your Password';
            }
            return null;
          },
        ),
      ],
    );
  }
}
