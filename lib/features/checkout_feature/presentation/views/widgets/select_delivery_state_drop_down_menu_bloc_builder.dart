import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/select_delivery_state_drop_down_menu.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_states.dart';

class SelectDeliveryStateDropDownMenuBlocBuilder extends StatelessWidget {
  const SelectDeliveryStateDropDownMenuBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(builder: (context, state) {
      if (state.getAddressesSuccessState != null) {
        return SelectDeliveryStateDropDownMenu(
          items: state.getAddressesSuccessState!,
        );
      } else {
        return const SelectDeliveryStateDropDownMenu(
          items: [],
        );
      }
    });
  }
}
