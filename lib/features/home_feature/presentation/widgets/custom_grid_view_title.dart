import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class CustomGridViewTitle extends StatelessWidget {
  const CustomGridViewTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: FontStyles.textStyleSemiBold20,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                "See All",
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
