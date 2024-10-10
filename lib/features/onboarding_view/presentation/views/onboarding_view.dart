import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_back_ground_container.dart';
import 'package:graduation_project/features/onboarding_view/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomBackGroundContainer(
        child: SafeArea(child: OnboardingViewBody()),
      ),
    );
  }
}
