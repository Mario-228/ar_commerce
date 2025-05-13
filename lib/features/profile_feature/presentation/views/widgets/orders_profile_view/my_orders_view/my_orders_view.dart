import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/widgets/custom_back_ground_container.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/orders_profile_view/my_orders_view/widgets/my_completed_orders_view_bloc_builder.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/orders_profile_view/my_orders_view/widgets/my_pending_orders_view_bloc_builder.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_orders_profile_cubit/get_order_profile_cubit.dart';

import '../../../../../../../core/utils/font_styles/font_styles.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => GetOrderProfileCubit()..getOrders(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () async =>
                      await GetOrderProfileCubit.get(context).getOrders(),
                  icon: const Icon(Icons.refresh),
                  tooltip: "Refresh Orders",
                ),
              ),
            ],
            centerTitle: true,
            title: const Text(
              "My Orders",
              style: FontStyles.textStyleBold22,
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Completed"),
                Tab(text: "Pending"),
              ],
            ),
          ),
          body: CustomBackGroundContainer(
            child: const TabBarView(
              children: [
                MyCompletedOrdersListViewBlocBuilder(),
                MyPendingOrdersViewBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
