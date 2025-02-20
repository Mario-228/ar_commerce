import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_appbar.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/current_delivery_address_body.dart';

class CurrentDeliveryAddressView extends StatelessWidget {
  const CurrentDeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: "Delivery Address",
      ),
      body: CurrentDeliveryAddressBody(),
    );
  }
}
