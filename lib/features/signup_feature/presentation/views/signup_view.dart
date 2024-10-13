import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_back_ground_container.dart';
import 'package:graduation_project/features/signup_feature/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackGroundContainer(
        child: SafeArea(
          child: SignupViewBody(),
        ),
      ),
    );
  }
}
