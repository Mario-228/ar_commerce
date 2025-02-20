import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        model.description,
        style: FontStyles.textStyleMeduim13.copyWith(color: AppColors.grey),
        softWrap: true,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
