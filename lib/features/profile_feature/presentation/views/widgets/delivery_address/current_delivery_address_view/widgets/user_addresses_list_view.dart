import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/address_list_tile.dart';
import '../../../../../../../checkout_feature/data/models/address_model.dart';

class UserAddressesListView extends StatelessWidget {
  const UserAddressesListView({
    super.key,
    required this.addresses,
  });
  final List<AddressModel> addresses;
  @override
  Widget build(BuildContext context) {
    if (addresses.isNotEmpty) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 10.0),
        itemCount: addresses.length,
        itemBuilder: (context, index) => AddressListTile(
          addressModel: addresses[index],
        ),
      );
    } else {
      return const Center(
        child: Text("No Addresses Found"),
      );
    }
  }
}
