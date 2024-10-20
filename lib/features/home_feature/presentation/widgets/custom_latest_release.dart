import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class CustomLatestRelease extends StatelessWidget {
  const CustomLatestRelease({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Latest Release",
          style: FontStyles.textStyleSemiBold20,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                "See All ${0xe09b}",
                style: FontStyles.textStyleRegular12
                    .copyWith(color: AppColors.glodenOrange),
              ),
              const SizedBox(width: 8.0),
              const Icon(
                Icons.arrow_forward,
                color: AppColors.glodenOrange,
              ),
            ],
          ),
        )
      ],
    );
  }
}
