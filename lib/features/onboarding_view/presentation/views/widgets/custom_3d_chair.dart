import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';

class Custom3DChair extends StatelessWidget {
  const Custom3DChair({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240.0,
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.sizeOf(context).width * 0.17,
            child: const Image(
              image: AssetImage(AppImages.assetsImagesLogo360),
            ),
          ),
          const Positioned(
            top: 50,
            child: Image(
              image: AssetImage(AppImages.assetsImagesColoredChair),
            ),
          ),
        ],
      ),
    );
  }
}
