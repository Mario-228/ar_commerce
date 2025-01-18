import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';

import 'package:graduation_project/core/widgets/custom_material_button.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/reset_password_feature/presentation/views_models/reset_password_cubit/reset_password_cubit.dart';
import 'package:graduation_project/features/reset_password_feature/presentation/views_models/reset_password_cubit/reset_password_states.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key, required this.email});
  final String email;
  static String otp = '';
  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: OtpTextField(
              numberOfFields: 6,
              keyboardType: TextInputType.number,
              borderColor: AppColors.darkGreen,
              filled: true,
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                otp = verificationCode;
              },
            ),
          ),
          const SizedBox(height: 50.0),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your password';
              } else if (value.length < 8) {
                return "Password must be at least 8 characters long";
              } else {
                return null;
              }
            },
            type: TextInputType.visiblePassword,
            labelText: "Enter Password",
            controller: passwordController,
          ),
          const SizedBox(height: 50.0),
          BlocProvider(
            create: (context) => ResetPasswordCubit(),
            child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  showSnackBar(context, "Password reset successfully");
                  GoRouter.of(context).push(AppRouters.kLoginView);
                } else if (state is ResetPasswordError) {
                  showSnackBar(context, state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is ResetPasswordLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.lightLimeGreen),
                  );
                } else {
                  return CustomMaterialButton(
                    text: "Restore Account",
                    color: AppColors.darkGreen,
                    onPressed: () async {
                      await ResetPasswordCubit.get(context)
                          .resetPassword(email, otp, passwordController.text);
                    },
                    textColor: AppColors.white,
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
