import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/core/utils/payment_to_api/payment_to_api.dart';
import 'package:graduation_project_new_version/core/utils/paymob_service/paymob_keys.dart';
import 'package:paymob_payment/paymob_payment.dart';

abstract class PaymobService {
  static void initPaymob() => PaymobPayment.instance.initialize(
        apiKey: PaymobKeys.apiKey,
        integrationID: int.parse(PaymobKeys.integrationId),
        iFrameID: int.parse(PaymobKeys.iFrameID),
      );

  static void payWithPaymob(
          {required BuildContext context,
          required double price,
          required int orderID}) =>
      PaymobPayment.instance.pay(
        context: context,
        currency: "EGP",
        amountInCents: "${(price * 100).roundToDouble()}",
        onPayment: (response) async {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
          if (response.success) {
            var result = await PaymentToApi.paymentToApi(
                transactionId: response.transactionID.toString(),
                paymentMethod: "paymob",
                orderID: orderID);
            result.fold((onError) {
              showSnackBar(context, onError.errorMessage);
            }, (onSuccess) {
              showSnackBar(context, onSuccess);
            });
          } else {
            if (context.mounted) {
              showSnackBar(context, "Payment Failed\n${response.message}");
            }
          }
          if (context.mounted) Navigator.pop(context);
        },
      );
}
