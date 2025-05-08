import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/orders_profile_view/my_orders_view/widgets/my_orders_view_body.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_orders_profile_cubit/get_order_profile_cubit.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Invoice")),
      body: BlocProvider(
        create: (context) => GetOrderProfileCubit()..getOrders(),
        child: MyOrdersViewBody(),
      ),
    );
  }
}
