import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';

class CustomOtpFormField extends StatelessWidget {
  const CustomOtpFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String otp = "";
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
              otp = verificationCode;
            },
          ),
        ),
        const SizedBox(height: 50.0),
        CustomMaterialButton(
          text: 'Confirm',
          onPressed: () {
            if (otp.length == 6) {
            } else {
              showSnackBar(context, 'Please enter a valid OTP');
            }
          },
          color: AppColors.darkGreen,
          textColor: AppColors.white,
        ),
      ],
    );
  }
}
