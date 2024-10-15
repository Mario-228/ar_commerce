import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_back_ground_container.dart';
import 'package:graduation_project/features/forgot_password_feature/presentation/views/widgets/forgot_password_view_body.dart';

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
