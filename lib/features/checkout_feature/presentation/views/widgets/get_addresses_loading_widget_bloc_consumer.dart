import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_states.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';

class GetAddressesLoadingWidgetBlocConsumer extends StatelessWidget {
  const GetAddressesLoadingWidgetBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state.getAddressesErrorState != null) {
            showSnackBar(context,
                "${state.getAddressesErrorState}\nClick Refresh Button To Try Again");
          }
        },
        builder: (context, state) =>
            state.isGetAddressLoading ? LinearProgressIndicator() : SizedBox());
  }
}
