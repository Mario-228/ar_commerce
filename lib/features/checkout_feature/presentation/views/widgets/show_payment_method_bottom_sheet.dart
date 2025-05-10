import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/paymob_service/paymob_service.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/payment_method_list_tile_item.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/payment_methods_cubit/payment_methods_cubit.dart';

import '../../../../../core/utils/paypal_service/paypal_service.dart';

Future<void> showPaymentMethodBottomSheet({
  required BuildContext context,
  required double total,
  required CartModel cartModel,
  required int id,
}) async {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return BlocProvider(
        create: (context) => PaymentMethodsCubit(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Payment Method',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Builder(builder: (context) {
                return PaymentMethodListTileItem(
                    onTap: () async => await stripePayment(context, total),
                    title: "stripe");
              }),
              PaymentMethodListTileItem(
                onTap: () =>
                    PaypalService.createPaypalPayment(context, cartModel),
                title: "paypal",
              ),
              PaymentMethodListTileItem(
                onTap: () => PaymobService.payWithPaymob(
                  context: context,
                  price: total,
                ),
                title: "paymob",
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> stripePayment(BuildContext context, double total) async {
  await PaymentMethodsCubit.get(context)
      .payWithStripe(
    PaymentIntentInputModel(amount: total.toString()),
  )
      .then(
    (value) {
      if (context.mounted) GoRouter.of(context).pop();
    },
  );
}
