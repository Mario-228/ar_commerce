import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 4),
        const Image(
          height: 150.0,
          width: 150.0,
          image: AssetImage(
            AppImages.assetsImagesLogo,
          ),
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(AppImages.assetsImagesBigChair),
            SvgPicture.asset(AppImages.assetsImagesSmallChair),
          ],
        ),
      ],
    );
  }
}
