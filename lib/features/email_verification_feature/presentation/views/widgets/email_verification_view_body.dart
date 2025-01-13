import 'package:flutter/material.dart';
import 'package:graduation_project/features/email_verification_feature/presentation/views/widgets/custom_otp_form_field.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            CustomOtpFormField(),
          ],
        ),
      ),
    );
  }
}
