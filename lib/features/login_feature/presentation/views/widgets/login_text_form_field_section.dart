import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/login_feature/presentation/views_models/login_cubit/login_cubit.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'custom_password_field_bloc_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          labelText: AppLocalizations.of(context)!.enterEmail,
          controller: LoginCubit.get(context).emailController,
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
        const SizedBox(height: 18.0),
        CustomPasswordFieldBlocBuilder(),
      ],
    );
  }

  static void clearFields(BuildContext context) {
    LoginCubit.get(context).emailController.clear();
    LoginCubit.get(context).passwordController.clear();
  }
}
