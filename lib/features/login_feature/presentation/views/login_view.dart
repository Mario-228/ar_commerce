import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_back_ground_container.dart';
import 'package:graduation_project/features/login_feature/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomBackGroundContainer(
        child: SafeArea(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
