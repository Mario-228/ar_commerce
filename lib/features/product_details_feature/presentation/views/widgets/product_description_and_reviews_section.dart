import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_description.dart';

class ProductDescriptionAndReviewsSection extends StatelessWidget {
  const ProductDescriptionAndReviewsSection(
      {super.key, required this.model, required this.isDescriptionSelected});
  final CustomProductItemModel model;
  final bool isDescriptionSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isDescriptionSelected
          ? ProductDescription(model: model)
          : MaterialButton(
              onPressed: () {
                reviewModalBottomSheet(context);
              },
              color: AppColors.lightOrange,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text("Write a review")),
    );
  }
}

Future<dynamic> reviewModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const SingleChildScrollView(
          child: SizedBox(
            height: 150,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text("type your review here:"),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.darkGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
