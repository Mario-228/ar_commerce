import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class ItemCounter extends StatefulWidget {
  ItemCounter({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;
  int counter = 1;
  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (widget.counter == 1) return;
            setState(() {
              widget.counter--;
            });
          },
          icon: const Icon(
            CupertinoIcons.minus_square,
            color: AppColors.orange,
          ),
        ),
        Text(
          "${widget.counter}",
          style: FontStyles.textStyleRegular14,
        ),
        IconButton(
          onPressed: () {
            if (widget.model.quantity == widget.counter) return;
            setState(() {
              widget.counter++;
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
