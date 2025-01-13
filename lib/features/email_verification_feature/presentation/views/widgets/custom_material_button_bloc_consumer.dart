import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';
import 'package:graduation_project/features/email_verification_feature/presentation/views_models/email_verification_cubit/email_verification_cubit.dart';
import 'package:graduation_project/features/email_verification_feature/presentation/views_models/email_verification_cubit/email_verification_states.dart';

class CustomMaterialButtonBlocConsumer extends StatelessWidget {
  const CustomMaterialButtonBlocConsumer({
    super.key,
    required this.otp,
  });

  final String otp;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationCubit, EmailVerificationStates>(
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          showSnackBar(context, 'Email verified successfully');
          GoRouter.of(context).push(AppRouters.kLoginView);
        } else if (state is EmailVerificationError) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is EmailVerificationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomMaterialButton(
            text: 'Confirm',
            onPressed: () {
              if (otp.length == 6) {
              } else {
                showSnackBar(context, 'Please enter a valid OTP');
              }
            },
            color: AppColors.darkGreen,
            textColor: AppColors.white,
          );
        }
      },
    );
  }
}
