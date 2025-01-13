import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_app_bar.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).width);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const CustomOtpFormField(),
            const SizedBox(height: 50.0),
            CustomMaterialButton(
              text: 'Confirm',
              onPressed: () {},
              color: AppColors.darkGreen,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomOtpFormField extends StatelessWidget {
  const CustomOtpFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: OtpTextField(
        numberOfFields: 6,
        keyboardType: TextInputType.number,
        borderColor: AppColors.darkGreen,
        filled: true,
        showFieldAsBox: true,
        onCodeChanged: (String code) {},
        onSubmit: (String verificationCode) {
          //send code to api ....
        },
      ),
    );
  }
}
