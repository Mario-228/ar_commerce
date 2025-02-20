import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class OnboardingButtonSection extends StatelessWidget {
  const OnboardingButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
          text: 'Existing User (Login)',
          color: AppColors.darkGreen,
          onPressed: () {},
        ),
        const SizedBox(height: 20.0),
        CustomMaterialButton(
          text: 'Existing User (Login)',
          color: AppColors.lightPink,
          onPressed: () {},
          textColor: AppColors.orange,
        ),
      ],
    );
  }
}
