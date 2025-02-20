import 'package:flutter/material.dart';
import '../utils/app_images/app_images.dart';
import '../utils/font_styles/font_styles.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 40.0,
          width: 85.0,
          image: AssetImage(AppImages.assetsImagesLogo),
        ),
        const SizedBox(height: 65.0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: FontStyles.textStyleBold28,
        ),
        const SizedBox(height: 7.0),
        Text(
          subtitle,
          style: FontStyles.textStyleRegular14,
        ),
      ],
    );
  }
}
