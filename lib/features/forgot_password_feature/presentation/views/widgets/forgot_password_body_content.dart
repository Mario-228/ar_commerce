import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/forgot_password_feature/presentation/views/widgets/send_verification_code_bloc_consumer.dart';
import '../../../../../core/widgets/custom_header_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../views_models/reset_password_cubit/forgot_password_cubit.dart';

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
          const CustomHeaderWidget(
              title: "Forgot Password",
              subtitle: "Login to your minifurs account"),
          const SizedBox(height: 40.0),
          CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your email';
                } else if (!(EmailValidator.validate(value))) {
                  return "Insert valid email";
                } else {
                  return null;
                }
              },
              type: TextInputType.emailAddress,
              labelText: "Enter Email Address",
              controller: ForgotPasswordCubit.get(context).emailController),
          const SizedBox(height: 35.0),
          SendVerificationCodeBlocConusmer(),
        ],
      ),
    );
  }
}
