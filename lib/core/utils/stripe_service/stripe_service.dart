import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/init_payment_sheet_input_model/init_payment_sheet_input_model.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/payment_intent_model/payment_intent_model.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/update_service.dart';
import '../../widgets/loading_without_action.dart';
import 'stripe_keys.dart';

class StripeService {
  Future<PaymentIntentModel> retrievePaymentIntent(
      String paymentIntentId) async {
    var response = await ApiService(BaseUrl.stripe).stripeGetData(
      endPoint: "payment_intents/$paymentIntentId",
      token: StripeKeys.secretkey,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel model) async {
    var response = await ApiService(BaseUrl.stripe).stripePostData(
        contentType: Headers.formUrlEncodedContentType,
        parameters: model.toJson(),
        endPoint: StripeKeys.createIntentUrl,
        token: StripeKeys.secretkey);
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet(
          {required InitPaymentSheetInputModel
              initPaymentSheetInputModel}) async =>
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          customerEphemeralKeySecret:
              initPaymentSheetInputModel.ephemeralKeySecret,
          customerId: initPaymentSheetInputModel.customerId,
          paymentIntentClientSecret:
              initPaymentSheetInputModel.paymentIntentClientSecret,
          merchantDisplayName: "Mario Youssef",
        ),
      );

  Future<void> presentPaymentSheet() async =>
      await Stripe.instance.presentPaymentSheet();

  Future<void> makePayment(
      {required PaymentIntentInputModel model,
      required BuildContext context,
      required int orderId}) async {
    var data = await createPaymentIntent(model);
    //before creating the ephemeral key we must create the customer id first
    // var ephemeralKeyModel = await createEphemeralKey(model.customerId);
    InitPaymentSheetInputModel inputModel = InitPaymentSheetInputModel(
      paymentIntentClientSecret: data.clientSecret!,
      customerId: model
          .customerId, //the customer id must get it from the endPoint in api keys (createCustomerIdUrl) and get the customer id ... must be only one id for one customer
      // ephemeralKeySecret: ephemeralKeyModel.id,
    );
    await initPaymentSheet(initPaymentSheetInputModel: inputModel);
    await presentPaymentSheet();
    var paymentIntentDetails = await retrievePaymentIntent(data.id!);
    log("The payment intent id is = ${paymentIntentDetails.id}");
    if (context.mounted) LoadingWithoutAction.show(context);
    if (paymentIntentDetails.status == "succeeded") {
      if (context.mounted) {
        var result = await updateOrderStatus(
            orderId: orderId, transactionId: paymentIntentDetails.id!);
        result.fold((onError) async {
          await CacheHelper.saveData<bool>(orderId.toString(), false);
          if (context.mounted) showSnackBar(context, onError.errorMessage);
        }, (onSuccess) {
          CacheHelper.saveData<bool>(orderId.toString(), true);
          showSnackBar(context, "Payment Success");
        });
        if (context.mounted) GoRouter.of(context).pop();
      }
    } else {
      if (context.mounted) {
        showSnackBar(context, "Payment Failed");
        GoRouter.of(context).pop();
      }
    }
    if (context.mounted) LoadingWithoutAction.hide(context);
  }

  Future<EphemeralKeyModel> createEphemeralKey(String customerId) async {
    var response = await ApiService(BaseUrl.stripe).stripePostData(
        headers: {
          "Authorization": "Bearer ${StripeKeys.secretkey}",
          "Stripe-Version": "2025-01-27.acacia",
        },
        contentType: Headers.formUrlEncodedContentType,
        parameters: {"customer": customerId},
        endPoint: StripeKeys.createEphemeralKeyUrl,
        token: StripeKeys.secretkey);
    return EphemeralKeyModel.fromJson(response.data);
  }

//////From ApI With orderId/////
  Future<Either<Errors, String>> stripePaymentWithOrderId(
      {required int orderId, required String transactionId}) async {
    try {
      var reponse = await ApiService(BaseUrl.products).putDataForStripe(
          "${StripeKeys.stripeEndPoint}$orderId/$transactionId");
      log("The reponse from api is = $reponse");
      return right("Success");
    } on Exception catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }
}
