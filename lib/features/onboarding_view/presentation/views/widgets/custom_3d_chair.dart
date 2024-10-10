import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';

class Custom3DChair extends StatelessWidget {
  const Custom3DChair({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200.0,
      child: Stack(
        alignment: Alignment(0.0, -2.0),
        children: [
          Image(
            height: 130.0,
            image: AssetImage(AppImages.assetsImagesLogo360),
          ),
          Image(
            height: 200.0,
            image: AssetImage(AppImages.assetsImagesColoredChair),
          ),
        ],
      ),
    );
  }
}
