import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import 'custom_material_button_bloc_consumer.dart';

class CustomOtpFormField extends StatelessWidget {
  static String otp = '';
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
              otp = verificationCode;
              print(otp);
            },
          ),
        ),
        const SizedBox(height: 50.0),
        const CustomMaterialButtonBlocConsumer(),
      ],
    );
  }
}
