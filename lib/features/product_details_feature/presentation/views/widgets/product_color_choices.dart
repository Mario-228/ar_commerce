import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';

class ProductColorChoices extends StatelessWidget {
  const ProductColorChoices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: AppColors.darkBrown,
            maxRadius: 10,
            minRadius: 10,
          ),
        ),
        const Padding(padding: EdgeInsets.only(right: 4.0)),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: AppColors.blueGrey,
            maxRadius: 10,
            minRadius: 10,
          ),
        ),
        const Padding(padding: EdgeInsets.only(right: 4.0)),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: AppColors.darkGreen,
            maxRadius: 10,
            minRadius: 10,
          ),
        ),
      ],
    );
  }
}
