import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({
    super.key,
    required this.model,
    this.quantity,
  });
  final CustomProductItemModel model;
  final int? quantity;
  static int counter = 0;

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  late bool hasQuantity;
  @override
  void initState() {
    super.initState();
    ItemCounter.counter = widget.quantity ?? 0;
    hasQuantity = (widget.model.quantity > 0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: hasQuantity
              ? () {
                  if (ItemCounter.counter == 1) return;
                  setState(() {
                    ItemCounter.counter--;
                  });
                }
              : null,
          icon: const Icon(
            CupertinoIcons.minus_square,
            color: AppColors.orange,
          ),
        ),
        Text(
          "${ItemCounter.counter}",
          style: FontStyles.textStyleRegular14,
        ),
        IconButton(
          onPressed: hasQuantity
              ? () {
                  if (widget.model.quantity == ItemCounter.counter) return;
                  setState(() {
                    ItemCounter.counter++;
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
