import 'package:flutter/material.dart';
import '../../../../core/utils/app_images/app_images.dart';

class HomeBackgroundContainer extends StatelessWidget {
  const HomeBackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decrationContainer(),
      child: const Image(
        image: AssetImage(AppImages.assetsImagesHomeBackground),
        fit: BoxFit.fill,
        opacity: AlwaysStoppedAnimation(0.5),
        width: double.infinity,
        height: 270.0,
      ),
    );
  }

  BoxDecoration decrationContainer() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-0.30, -0.95),
        end: Alignment(0.3, 0.95),
        colors: [
          Color(0xFF00332B),
          Color(0xFF08443B),
        ],
      ),
    );
  }
}
