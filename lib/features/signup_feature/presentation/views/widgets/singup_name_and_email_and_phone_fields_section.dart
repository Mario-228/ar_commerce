import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../views_models/sign_up_cubit/sign_up_cubit.dart';

class SignupNameAndEmailAndPhoneFieldsSection extends StatelessWidget {
  const SignupNameAndEmailAndPhoneFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          labelText: "Full Name",
          controller: SignUpCubit.get(context).nameController,
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
          controller: SignUpCubit.get(context).emailController,
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
        CustomTextFormField(
          type: TextInputType.phone,
          labelText: "Phone Number",
          controller: SignUpCubit.get(context).phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Insert Phone Number";
            } else if (value.length != 11) {
              return "number must be 11 digits";
            } else if (value.substring(0, 3) != "012" &&
                value.substring(0, 3) != "015" &&
                value.substring(0, 3) != "010" &&
                value.substring(0, 3) != "011") {
              return "Insert valid phone number";
            }
            return null;
          },
        ),
      ],
    );
  }
}
