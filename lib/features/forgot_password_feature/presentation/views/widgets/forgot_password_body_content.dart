import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/widgets/custom_header_widget.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';

class ForgotPasswordBodyContent extends StatelessWidget {
  const ForgotPasswordBodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
    return Form(
      key: forgetPasswordFormKey,
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
              controller: TextEditingController()),
          const SizedBox(height: 35.0),
          CustomMaterialButton(
            text: "Send Email",
            color: AppColors.darkGreen,
            onPressed: () {
              if (forgetPasswordFormKey.currentState!.validate()) {
                GoRouter.of(context).push(AppRouters.kPasswordResetView);
              }
            },
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
