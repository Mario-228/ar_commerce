import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/orders_profile_view/my_order_details_view/widgets/my_order_details_view_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../../../core/widgets/custom_appbar.dart';

class MyOrderDetailsView extends StatelessWidget {
  const MyOrderDetailsView({super.key, required this.productItemModel});
  final CustomProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: AppLocalizations.of(context)!.myOrders),
      body: MyOrderDetailsViewBody(
        productItemModel: productItemModel,
      ),
    );
  }
}
