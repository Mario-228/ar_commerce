import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_back_ground_container.dart';
import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomBackGroundContainer(
        child: SafeArea(
          bottom: false,
          child: ForgotPasswordViewBody(),
        ),
      ),
    );
  }
}
