import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/custom_item_list_view.dart';
import '../../views_models/cart_cubit/cart_cubit.dart';
import '../../views_models/cart_cubit/cart_states.dart';

class CustomItemCartListViewBlocBuilder extends StatelessWidget {
  const CustomItemCartListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        if (state is GetCartSuccessState) {
          return CustomItemCartListView(cartModel: state.cartModel);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
