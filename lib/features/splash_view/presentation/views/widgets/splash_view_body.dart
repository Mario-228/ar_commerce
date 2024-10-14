import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/features/splash_view/presentation/views/widgets/sliding_animation_logo.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> slideAnimation;
  late AnimationController slideController;
  @override
  void initState() {
    super.initState();
    initSlideAnimation();
    navigateToLoginScreen();
  }

  @override
  void dispose() {
    super.dispose();
    slideController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 4),
        SlidingAnimationLogo(slideAnimation: slideAnimation),
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

  void initSlideAnimation() {
    slideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: const Offset(0, 0))
            .animate(slideController);
    slideController.forward();
  }

  void navigateToLoginScreen() {
    Future.delayed(
      const Duration(milliseconds: 4000),
      () => GoRouter.of(context).pushReplacement(AppRouters.kLoginView),
    );
  }
}
