import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/utils/font_styles/font_styles.dart';

class AddressListTile extends StatelessWidget {
  const AddressListTile({
    super.key,
    required this.name,
    required this.address,
    required this.phoneNumber,
  });
  final String name;
  final String address;
  final String phoneNumber;
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
          Text(name, style: FontStyles.textStyleDarkGreenBold16),
          const Icon(Icons.edit_outlined, color: AppColors.darkGrey),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          Text(
            address,
            style: FontStyles.textStyleLight13,
          ),
          Text(phoneNumber, style: FontStyles.textStyleLight13),
        ],
      ),
    );
  }
}
