import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_header_widget.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../views_models/reset_password_cubit/forgot_password_cubit.dart';
import '../../views_models/reset_password_cubit/forgot_password_states.dart';

class ForgotPasswordBodyContent extends StatelessWidget {
  const ForgotPasswordBodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
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
              controller: emailController),
          const SizedBox(height: 35.0),
          BlocProvider(
            create: (context) => ForgotPasswordCubit(),
            child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
              listener: (context, state) {
                if (state is ForgotPasswordSuccess) {
                  showSnackBar(context, 'Code sent successfully');
                  GoRouter.of(context).push(AppRouters.kResetPasswordView,
                      extra: emailController.text);
                } else if (state is ForgotPasswordError) {
                  showSnackBar(
                      context, "Something went wrong please try again");
                }
              },
              builder: (context, state) {
                if (state is ForgotPasswordLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return CustomMaterialButton(
                    text: "Send Verification Code",
                    color: AppColors.darkGreen,
                    onPressed: () async {
                      if (forgetPasswordFormKey.currentState!.validate()) {
                        await ForgotPasswordCubit.get(context)
                            .emailRestoration(emailController.text);
                      }
                    },
                    textColor: AppColors.white,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
