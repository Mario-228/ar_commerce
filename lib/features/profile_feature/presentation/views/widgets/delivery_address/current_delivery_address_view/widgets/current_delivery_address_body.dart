import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/address_list_tile.dart';
import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../../../../core/widgets/custom_material_button.dart';

class CurrentDeliveryAddressBody extends StatelessWidget {
  const CurrentDeliveryAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          const AddressListTile(
            name: "Name",
            address: "Address",
            phoneNumber: "Phone Number",
          ),
          const SizedBox(height: 40.0),
          CustomMaterialButton(
            text: "Add New Address",
            color: AppColors.lightGrey,
            textColor: AppColors.lightLimeGreen,
            onPressed: () {
              GoRouter.of(context).push(AppRouters.kAddDeliveryAddress);
            },
          ),
        ],
      ),
    );
  }
}
