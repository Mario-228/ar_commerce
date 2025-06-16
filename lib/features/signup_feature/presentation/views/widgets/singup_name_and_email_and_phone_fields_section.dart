import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          labelText: AppLocalizations.of(context)!.fullName,
          controller: SignUpCubit.get(context).nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.insertName;
            }
            return null;
          },
        ),
        const SizedBox(height: 30.0),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: AppLocalizations.of(context)!.enterEmail,
          controller: SignUpCubit.get(context).emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.enterYourEmail;
            } else if (!(EmailValidator.validate(value))) {
              return AppLocalizations.of(context)!.insertValidEmail;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 30.0),
        CustomTextFormField(
          type: TextInputType.phone,
          labelText: AppLocalizations.of(context)!.phoneNumber,
          controller: SignUpCubit.get(context).phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.insertPhoneNumber;
            } else if (value.length != 11) {
              return AppLocalizations.of(context)!.numberMustBe11Digits;
            } else if (value.substring(0, 3) != "012" &&
                value.substring(0, 3) != "015" &&
                value.substring(0, 3) != "010" &&
                value.substring(0, 3) != "011") {
              return AppLocalizations.of(context)!.insertValidPhone;
            }
            return null;
          },
        ),
      ],
    );
  }
}
