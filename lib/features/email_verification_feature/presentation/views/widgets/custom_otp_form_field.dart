import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:graduation_project_new_version/features/email_verification_feature/presentation/views_models/email_verification_cubit/email_verification_cubit.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import 'custom_material_button_bloc_consumer.dart';

class CustomOtpFormField extends StatelessWidget {
  const CustomOtpFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              EmailVerificationCubit.get(context).otp = verificationCode;
            },
          ),
        ),
        const SizedBox(height: 50.0),
        const CustomMaterialButtonBlocConsumer(),
      ],
    );
  }
}
