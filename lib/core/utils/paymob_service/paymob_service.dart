import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/core/utils/paymob_service/paymob_keys.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

abstract class PaymobService {
  static void initPaymob() => PaymentData.initialize(
      apiKey: PaymobKeys.apiKey,
      iframeId: PaymobKeys.iFrameID,
      integrationCardId: PaymobKeys.integrationId,
      integrationMobileWalletId: PaymobKeys.walletIntegrationId);

  static void payWithPaymob(
      {required BuildContext context, required double price}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentView(
          onPaymentSuccess: () {
            GoRouter.of(context).pop();
            showSnackBar(context, 'Payment Successfull');
          },
          onPaymentError: () {
            GoRouter.of(context).pop();
            showSnackBar(context, 'Payment Failed');
            log('Payment Failed');
          },
          price: price,
        ),
      ),
    );
  }
}
