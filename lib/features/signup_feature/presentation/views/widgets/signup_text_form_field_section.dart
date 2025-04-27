import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/signup_feature/presentation/views/widgets/signup_gender_section.dart';
import 'package:graduation_project_new_version/features/signup_feature/presentation/views/widgets/singup_name_and_email_and_phone_fields_section.dart';
import 'password_field_and_strength_checker.dart';

class SignupTextFormFieldSection extends StatelessWidget {
  const SignupTextFormFieldSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignupNameAndEmailAndPhoneFieldsSection(),
        const SizedBox(height: 30.0),
        PasswordFieldAndStrengthChecker(),
        const SizedBox(height: 30.0),
        SignupGenderSection(),
      ],
    );
  }
}
