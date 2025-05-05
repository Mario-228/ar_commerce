import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/utils/ar_service/ar_sevice.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/repos/cart_repo_implementation.dart';
import 'package:graduation_project_new_version/features/product_details_feature/data/repos/get_ar_url_repo_implementation.dart';
import 'package:graduation_project_new_version/features/product_details_feature/presentation/views/widgets/item_counter.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/ar_service/ar_core_device_compatibility.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class ProductDetailsViewFooter extends StatelessWidget {
  const ProductDetailsViewFooter({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    final bool isArSupported =
        ArCoreDeviceCompatibility().checkDeviceCompatibility() as bool;
    return isArSupported
        ? MaterialButton(
            onPressed: () => addItemToCartFromProductDetailsFeature(context),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: AppColors.black)),
            child:
                const Text("Add to cart", style: FontStyles.textStyleMedium12),
          )
        : Row(
            children: [
              MaterialButton(
                minWidth: 70,
                onPressed: () =>
                    addItemToCartFromProductDetailsFeature(context),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: AppColors.black)),
                child: const Text("Add to cart",
                    style: FontStyles.textStyleMedium12),
              ),
              const SizedBox(
                width: 20.0,
              ),
              MaterialButton(
                onPressed: () async {
                  var url = await GetArUrlRepoImplementation()
                      .getArUrl(productId: model.id);
                  url.fold((onError) {
                    showSnackBar(context, onError.errorMessage);
                  }, (onSuccess) {
                    ARService.launch(onSuccess);
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: AppColors.darkGreen,
                child: const Text(
                  "Set in your space",
                  style: FontStyles.textStyleMeduimWhite13,
                ),
              )
            ],
          );
  }

  Future<void> addItemToCartFromProductDetailsFeature(
      BuildContext context) async {
    await CartRepoImplementation()
        .addToCart(
            productId: model.id,
            quantity:
                ItemCounter.counter) //must fix the problem with the quantity
        .then((value) {
      value.fold((onError) {
        showSnackBar(context, onError.errorMessage);
      }, (onSuccess) {
        showSnackBar(context, " Added to cart");
      });
    });
  }
}
