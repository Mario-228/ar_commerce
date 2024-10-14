import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';

class SlidingAnimationLogo extends StatelessWidget {
  const SlidingAnimationLogo({
    super.key,
    required this.slideAnimation,
  });

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, _) => SlideTransition(
        position: slideAnimation,
        child: const Image(
          height: 150.0,
          width: 150.0,
          image: AssetImage(
            AppImages.assetsImagesLogo,
          ),
        ),
      ),
    );
  }
}
