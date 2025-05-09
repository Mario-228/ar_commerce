import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/init_payment_sheet_input_model/init_payment_sheet_input_model.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:graduation_project_new_version/core/utils/stripe_service/models/payment_intent_model/payment_intent_model.dart';

import 'stripe_keys.dart';

class StripeService {
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

  Future<void> makePayment({required PaymentIntentInputModel model}) async {
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
}
