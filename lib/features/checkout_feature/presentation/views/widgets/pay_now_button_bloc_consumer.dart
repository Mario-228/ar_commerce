import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/show_payment_method_bottom_sheet.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../cart_feature/data/models/cart_model.dart';
import '../../views_models/checkout_cubit/checkout_cubit.dart';
import '../../views_models/checkout_cubit/checkout_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PayNowButtonBlocConsumer extends StatelessWidget {
  const PayNowButtonBlocConsumer({
    super.key,
    required this.total,
    required this.cartModel,
  });

  final double total;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) async {
      if (state.storeOrderErrorState != null) {
        showSnackBar(context, state.storeOrderErrorState!);
      } else if (state.storeOrderSuccessState != null) {
        showSnackBar(context, AppLocalizations.of(context)!.successfulOrder);
        await showPaymentMethodBottomSheet(
          context: context,
          total: total,
          cartModel: cartModel,
          id: state.storeOrderSuccessState!.order.id,
        );
        log(state.storeOrderSuccessState!.order.id.toString());
      }
    }, builder: (context, state) {
      if (state.isOrderLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return CustomMaterialButton(
          text: "Pay Now",
          color: AppColors.darkGreen,
          onPressed: () async => await CheckoutCubit.get(context).storeOrder(),
          height: 60.0,
        );
      }
    });
  }
}
