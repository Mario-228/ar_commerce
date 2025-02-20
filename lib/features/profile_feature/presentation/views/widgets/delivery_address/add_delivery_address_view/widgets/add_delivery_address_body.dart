import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/delivery_address/add_delivery_address_view/widgets/add_address_view_footer.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/delivery_address/add_delivery_address_view/widgets/new_address_input_feilds.dart';

class AddDeliveryAddressBody extends StatelessWidget {
  const AddDeliveryAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Delivery Details",
              style: FontStyles.textStyleRegular16,
            ),
          ),
          const SizedBox(height: 20),
          const NewAddressInputFeilds(),
          const SizedBox(height: 40),
          CustomMaterialButton(
            color: AppColors.darkGreen,
            text: "Add New Address",
            onPressed: () {},
            textColor: AppColors.white,
          ),
          const SizedBox(height: 5),
          const AddAddressViewFooter(),
        ]),
      ),
    );
  }
}
