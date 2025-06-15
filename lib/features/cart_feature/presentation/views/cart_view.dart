import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project_new_version/core/widgets/custom_appbar.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/cart_view_body.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views_models/cart_cubit/cart_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: CustomAppbar(
          title: AppLocalizations.of(context)!.cart,
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () async =>
                    await CartCubit.get(context).deleteCart(),
                icon: Icon(
                  Icons.delete,
                  color: AppColors.darkGreen,
                ),
              );
            }),
          ],
        ),
        body: const CartViewBody(),
      ),
    );
  }
}
