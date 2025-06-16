import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/forgot_password_feature/presentation/views/widgets/send_verification_code_bloc_consumer.dart';
import '../../../../../core/widgets/custom_header_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../views_models/reset_password_cubit/forgot_password_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordBodyContent extends StatelessWidget {
  const ForgotPasswordBodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ForgotPasswordCubit.get(context).forgetPasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 30.0),
          CustomHeaderWidget(
              title: AppLocalizations.of(context)!.forgotPassword,
              subtitle: AppLocalizations.of(context)!.loginToAccount),
          const SizedBox(height: 40.0),
          CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.enterYourEmail;
                } else if (!(EmailValidator.validate(value))) {
                  return AppLocalizations.of(context)!.insertValidEmail;
                } else {
                  return null;
                }
              },
              type: TextInputType.emailAddress,
              labelText: AppLocalizations.of(context)!.enterEmail,
              controller: ForgotPasswordCubit.get(context).emailController),
          const SizedBox(height: 35.0),
          SendVerificationCodeBlocConusmer(),
        ],
      ),
    );
  }
}
