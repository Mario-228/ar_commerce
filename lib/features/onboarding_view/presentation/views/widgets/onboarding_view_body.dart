import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/features/onboarding_view/presentation/views/widgets/custom_3d_chair.dart';
import 'package:graduation_project/features/onboarding_view/presentation/views/widgets/custom_privacy_policy.dart';
import 'package:graduation_project/features/onboarding_view/presentation/views/widgets/onboarding_button_section.dart';
import 'package:graduation_project/features/onboarding_view/presentation/views/widgets/onboarding_text_section.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Custom3DChair(),
          OnboardingTextSection(),
          SizedBox(height: 48.0),
          OnboardingButtonSection(),
          SizedBox(height: 10.0),
          CustomPrivacyPolicyText(),
          Spacer(),
        ],
      ),
    );
  }
}
