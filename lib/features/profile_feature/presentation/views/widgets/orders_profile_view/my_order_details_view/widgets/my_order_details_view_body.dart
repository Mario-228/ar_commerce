import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../../../../../core/widgets/order_list_tile.dart';

class MyOrderDetailsViewBody extends StatelessWidget {
  const MyOrderDetailsViewBody({super.key, required this.productItemModel});
  final CustomProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OrderListTile(productItemModel: productItemModel),
            Text(
              AppLocalizations.of(context)!.trackingDetails,
              style: FontStyles.textStyleRegular15,
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
