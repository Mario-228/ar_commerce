import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors/app_colors.dart';
import '../../../../core/utils/font_styles/font_styles.dart';
import '../../data/models/category_item_model.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.item,
    this.isSelected = false,
  });
  final CategoryItemModel item;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45.0,
          width: 45.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(11.0)),
            color: isSelected ? AppColors.orange : AppColors.greyShade800,
          ),
          child: Image(
            image: NetworkImage(
              item.image,
              // color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(item.title, style: FontStyles.textStyleMedium8),
      ],
    );
  }
}
