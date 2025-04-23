import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:graduation_project_new_version/features/reset_password_feature/presentation/views/widgets/reset_password_strength_checker.dart';
import 'package:graduation_project_new_version/features/reset_password_feature/presentation/views/widgets/restore_account_bloc_consumer_button.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../views_models/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: ResetPasswordCubit.get(context).resetPasswordFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: OtpTextField(
                  numberOfFields: 6,
                  keyboardType: TextInputType.number,
                  borderColor: AppColors.darkGreen,
                  filled: true,
                  showFieldAsBox: true,
                  onSubmit: (String verificationCode) {
                    ResetPasswordCubit.get(context).otp = verificationCode;
                  },
                ),
              ),
              const SizedBox(height: 50.0),
              ResetPasswordStrengthChecker(),
              const SizedBox(height: 50.0),
              RestoreAccountBlocConsumerButton(email: email),
            ],
          ),
        ),
      ),
    );
  }
}
