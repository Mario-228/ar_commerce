import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
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
    return BlocConsumer<GetOrderProfileCubit, GetOrderProfileState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          showSnackBar(context, state.errorMessage!);
        } else if (state.isDeleted) {
          showSnackBar(context, "Order deleted successfully");
        }
      },
      builder: (context, state) {
        if (state.isLoadingWhenDeleteOrder) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ElevatedButton(
            onPressed: () async => await GetOrderProfileCubit.get(context)
                .deleteOrder(orderId: order.id),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete"),
          );
        }
      },
    );
  }
}
