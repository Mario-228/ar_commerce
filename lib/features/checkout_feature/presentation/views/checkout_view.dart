import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/widgets/custom_appbar.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/checkout_view_body.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit()..getAddresses(),
      child: Scaffold(
        appBar: CustomAppbar(title: "Checkout", actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () async =>
                  await CheckoutCubit.get(context).getAddresses(),
              icon: Icon(
                Icons.refresh,
              ),
            ),
          ),
        ]),
        body:
            CheckoutViewBody(total: cartModel.totalCart, cartModel: cartModel),
      ),
    );
  }
}
