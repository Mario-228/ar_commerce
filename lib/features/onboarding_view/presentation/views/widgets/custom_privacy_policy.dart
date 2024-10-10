import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class CustomPrivacyPolicyText extends StatelessWidget {
  const CustomPrivacyPolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text:
                'By tapping Create Account and using Minifurs, you\nagree to our ',
            style: FontStyles.textStyleLight10,
          ),
          TextSpan(
            text: 'Terms of Servce & Privacy Policy',
            style: FontStyles.textStyleLight10
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
