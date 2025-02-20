import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_back_ground_container.dart';
import 'widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomBackGroundContainer(
        child: SafeArea(
          child: SignupViewBody(),
        ),
      ),
    );
  }
}
