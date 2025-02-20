import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/delivery_address/add_delivery_address_view/widgets/add_delivery_address_body.dart';
import 'package:graduation_project/core/widgets/custom_appbar.dart';

class AddDeliveryAddressView extends StatelessWidget {
  const AddDeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: "Add Delivery Address"),
      body: AddDeliveryAddressBody(),
    );
  }
}
