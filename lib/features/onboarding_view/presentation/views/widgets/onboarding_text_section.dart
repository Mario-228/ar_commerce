import 'package:flutter/material.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class OnboardingTextSection extends StatelessWidget {
  const OnboardingTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Optimize your space using tech and creativity in africa",
            style: FontStyles.textStyleBold20,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 6.0),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Fitting your furnitures in your space before buying",
            style: FontStyles.textStyleMeduim13,
          ),
        ),
      ],
    );
  }
}
