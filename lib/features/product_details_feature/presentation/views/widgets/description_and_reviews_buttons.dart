import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class DescriptionAndReviewsButtons extends StatelessWidget {
  const DescriptionAndReviewsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: () {},
          color: AppColors.lightOrange,
          height: 40,
          minWidth: 105,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Description",
              style: FontStyles.textStyleSemiBold14.copyWith(
                color: AppColors.orange,
              ),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {},
          color: AppColors.transparent,
          height: 40,
          minWidth: 105,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Reviews",
              style: FontStyles.textStyleRegular14.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
