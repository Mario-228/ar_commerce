import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/utils/font_styles/font_styles.dart';

class AddressListTile extends StatelessWidget {
  const AddressListTile({
    super.key,
    required this.addressModel,
  });
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      tileColor: AppColors.white,
      splashColor: AppColors.lightGrey,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            addressModel.receiverName,
            style: FontStyles.textStyleDarkGreenBold16,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => GoRouter.of(context)
                    .push(AppRouters.kEditUserAddressView, extra: addressModel),
                icon:
                    const Icon(Icons.edit_outlined, color: AppColors.darkGrey),
              ),
              IconButton(
                onPressed: () async => await CheckoutCubit.get(context)
                    .deleteAddress(addressId: addressModel.id!),
                icon: const Icon(Icons.delete_outline, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          Text(
            addressModel.address,
            style: FontStyles.textStyleLight13,
          ),
          Text(
            addressModel.phone,
            style: FontStyles.textStyleLight13,
          ),
        ],
      ),
    );
  }
}
