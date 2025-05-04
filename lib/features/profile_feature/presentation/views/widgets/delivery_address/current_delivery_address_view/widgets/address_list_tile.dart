import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';

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
          Text(addressModel.receiverName,
              style: FontStyles.textStyleDarkGreenBold16),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined, color: AppColors.darkGrey),
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
          Text(addressModel.phone, style: FontStyles.textStyleLight13),
        ],
      ),
    );
  }
}
