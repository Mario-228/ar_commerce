import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/widgets/custom_appbar.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/cart_view_body.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views_models/cart_cubit/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Cart"),
      body: BlocProvider(
        create: (context) => CartCubit()..getCart(),
        child: CartViewBody(),
      ),
    );
  }
}
