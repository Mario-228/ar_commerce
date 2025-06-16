import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../data/models/get_orders_model.dart';
import '../../../../../views_models/get_orders_profile_cubit/get_order_profile_cubit.dart';
import '../../../../../views_models/get_orders_profile_cubit/get_order_profile_states.dart';

class DeleteOrderButtonBlocConsumer extends StatelessWidget {
  const DeleteOrderButtonBlocConsumer({
    super.key,
    required this.order,
  });
  final GetOrderModel order;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderProfileCubit, GetOrderProfileState>(
      // listener: (context, state) {
      //   final isLoading = state.ordersLoadingStatus[order.id] ?? false;
      //   if (state.errorMessage != null && !isLoading) {
      //     showSnackBar(context, state.errorMessage!);
      //   } else if (state.isDeleted && !isLoading) {
      //     showSnackBar(context, "Order deleted successfully");
      //   }
      // },
      builder: (context, state) {
        final isLoading = state.ordersLoadingStatus[order.id] ?? false;
        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ElevatedButton(
            onPressed: () async => await GetOrderProfileCubit.get(context)
                .deleteOrder(orderId: order.id),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.delete),
          );
        }
      },
    );
  }
}
