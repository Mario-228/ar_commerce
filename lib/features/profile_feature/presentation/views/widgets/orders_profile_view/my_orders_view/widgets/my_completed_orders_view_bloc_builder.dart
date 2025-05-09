import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/orders_profile_view/my_orders_view/widgets/order_detail_item.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_orders_profile_cubit/get_order_profile_cubit.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_orders_profile_cubit/get_order_profile_states.dart';
import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/utils/font_styles/font_styles.dart';

class MyCompletedOrdersListViewBlocBuilder extends StatelessWidget {
  const MyCompletedOrdersListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderProfileCubit, GetOrderProfileStates>(
      builder: (context, state) {
        if (state is GetOrderProfileSuccessState) {
          return ListView.separated(
            padding: const EdgeInsets.all(20.0),
            itemCount: state.completedOrders.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 10.0),
            itemBuilder: (context, index) => OrderDetailItem(
              order: state.completedOrders[index],
            ),
          );
        } else if (state is GetOrderProfileLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return const CircleAvatar(
            radius: 80,
            backgroundColor: AppColors.darkGreen,
            child: Text("No Pending Orders", style: FontStyles.textStyleBold19),
          );
        }
      },
    );
  }
}
