import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import 'product_description_and_reviews_section.dart';

class DescriptionAndReviewsButtons extends StatefulWidget {
  const DescriptionAndReviewsButtons({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;

  @override
  State<DescriptionAndReviewsButtons> createState() =>
      _DescriptionAndReviewsButtonsState();
}

class _DescriptionAndReviewsButtonsState
    extends State<DescriptionAndReviewsButtons> {
  bool isDescriptionSelected = true;
  @override
  Widget build(BuildContext context) {
    //Description and reviews buttons
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  isDescriptionSelected = true;
                });
              },
              color: isDescriptionSelected
                  ? AppColors.lightOrange
                  : AppColors.transparent,
              splashColor: AppColors.transparent,
              height: 40,
              minWidth: 105,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Description",
                  style: FontStyles.textStyleSemiBold14.copyWith(
                    color: isDescriptionSelected
                        ? AppColors.orange
                        : AppColors.black,
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  isDescriptionSelected = false;
                });
              },
              color: isDescriptionSelected
                  ? AppColors.transparent
                  : AppColors.lightOrange,
              splashColor: AppColors.transparent,
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
                    color: isDescriptionSelected
                        ? AppColors.black
                        : AppColors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ProductDescriptionAndReviewsSection(
            model: widget.model, isDescriptionSelected: isDescriptionSelected)
      ],
    );
  }
}
