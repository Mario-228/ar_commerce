import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/delivery_address/current_delivery_address_view/widgets/address_list_tile.dart';
import '../../../../../../../checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import '../../../../../../../checkout_feature/presentation/views_models/checkout_cubit/checkout_states.dart';

class UserAddressesListViewBlocBuilder extends StatelessWidget {
  const UserAddressesListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        if (state.isGetAddressLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          final addresses = state.getAddressesSuccessState;
          if (addresses.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.noAddressFound,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(bottom: 10),
                  child: AddressListTile(addressModel: addresses[index]),
                ),
                childCount: addresses.length,
              ),
            );
          }
        }
      },
    );
  }
}
