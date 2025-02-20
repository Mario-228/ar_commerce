import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_back_ground_container.dart';
import 'widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackGroundContainer(
        child: SafeArea(
          child: ResetPasswordViewBody(
            email: email,
          ),
        ),
      ),
    );
  }
}
