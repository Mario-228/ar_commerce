import 'package:flutter/material.dart';
import '../utils/app_images/app_images.dart';

class CustomBackGroundContainer extends StatelessWidget {
  const CustomBackGroundContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          AppImages.assetsImagesBackground,
        ),
        opacity: 0.2,
        fit: BoxFit.cover,
      )),
      child: child,
    );
  }
}
