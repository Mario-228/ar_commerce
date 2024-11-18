import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class ItemCounter extends StatelessWidget {
  const ItemCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.minus_square,
            color: AppColors.orange,
          ),
        ),
        const Text(
          "1",
          style: FontStyles.textStyleRegular14,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.plus_square,
            color: AppColors.orange,
          ),
        ),
      ],
    );
  }
}
