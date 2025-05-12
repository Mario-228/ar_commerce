import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/orders_profile_view/my_orders_view/widgets/order_detail_item.dart';
import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../../views_models/get_orders_profile_cubit/get_order_profile_cubit.dart';
import '../../../../../views_models/get_orders_profile_cubit/get_order_profile_states.dart';

class MyPendingOrdersViewBlocBuilder extends StatelessWidget {
  const MyPendingOrdersViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderProfileCubit, GetOrderProfileState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (state.pendingOrders.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: state.pendingOrders.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 10.0),
              itemBuilder: (context, index) => OrderDetailItem(
                order: state.pendingOrders[index],
              ),
            );
          } else {
            return const Center(
              child: CircleAvatar(
                radius: 120.0,
                backgroundColor: AppColors.darkGreen,
                child: Text("No Pending Orders",
                    style: FontStyles.textStyleBold19),
              ),
            );
          }
        }
      },
    );
  }
}
