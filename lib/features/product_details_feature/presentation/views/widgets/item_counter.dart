import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  @override
  Widget build(BuildContext context) {
    int counter = 1;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (counter == 1) return;
            setState(() {
              counter--;
            });
          },
          icon: const Icon(
            CupertinoIcons.minus_square,
            color: AppColors.orange,
          ),
        ),
        Text(
          "$counter",
          style: FontStyles.textStyleRegular14,
        ),
        IconButton(
          onPressed: () {
            if (widget.model.quantity == counter) return;
            setState(() {
              counter++;
            });
          },
          icon: const Icon(
            CupertinoIcons.plus_square,
            color: AppColors.orange,
          ),
        ),
      ],
    );
  }
}
