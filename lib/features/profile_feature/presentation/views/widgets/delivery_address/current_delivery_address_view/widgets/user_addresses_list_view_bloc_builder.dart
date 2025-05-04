import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/user_addresses_list_view.dart';
import '../../../../../../../checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import '../../../../../../../checkout_feature/presentation/views_models/checkout_cubit/checkout_states.dart';

class UserAddressesListViewBlocBuilder extends StatelessWidget {
  const UserAddressesListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutStates>(
        builder: (context, state) {
      if (state is CheckoutSuccessState) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: UserAddressesListView(addresses: state.addresses),
          ),
        );
      } else if (state is CheckoutLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Center(
          child: Text("No Addresses Found"),
        );
      }
    });
  }
}
