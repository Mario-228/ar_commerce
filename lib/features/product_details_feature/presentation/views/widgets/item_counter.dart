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
  int counter = 0;
  late bool hasQuantity;
  @override
  void initState() {
    super.initState();
    hasQuantity = (widget.model.quantity > 0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: hasQuantity
              ? () {
                  if (counter == 1) return;
                  setState(() {
                    counter--;
                  });
                }
              : null,
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
          onPressed: hasQuantity
              ? () {
                  if (widget.model.quantity == counter) return;
                  setState(() {
                    counter++;
                  });
                }
              : null,
          icon: const Icon(
            CupertinoIcons.plus_square,
            color: AppColors.orange,
          ),
        ),
      ],
    );
  }
}
