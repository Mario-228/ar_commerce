import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/features/forgot_password_feature/presentation/views_models/reset_password_cubit/forgot_password_cubit.dart';
import 'package:graduation_project_new_version/features/forgot_password_feature/presentation/views_models/reset_password_cubit/forgot_password_states.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class SendVerificationCodeBlocConusmer extends StatelessWidget {
  const SendVerificationCodeBlocConusmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          showSnackBar(context, 'Code sent successfully');
          GoRouter.of(context).push(AppRouters.kResetPasswordView,
              extra: ForgotPasswordCubit.get(context).emailController.text);
        } else if (state is ForgotPasswordError) {
          showSnackBar(context, "Something went wrong please try again");
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
              if (ForgotPasswordCubit.get(context)
                  .forgetPasswordFormKey
                  .currentState!
                  .validate()) {
                await ForgotPasswordCubit.get(context).emailRestoration();
              }
            },
            textColor: AppColors.white,
          );
        }
      },
    );
  }
}
