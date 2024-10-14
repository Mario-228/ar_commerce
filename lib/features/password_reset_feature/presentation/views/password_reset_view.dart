import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_back_ground_container.dart';
import 'package:graduation_project/features/password_reset_feature/presentation/views/widgets/password_reset_view_body.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomBackGroundContainer(
        child: SafeArea(
          child: PasswordResetViewBody(),
        ),
      ),
    );
  }
}
