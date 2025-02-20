import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_back_ground_container.dart';
import 'widgets/login_view_body.dart';

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
