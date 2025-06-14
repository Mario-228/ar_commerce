import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/store_address_input_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/store_order_output_model.dart';

import '../../../../core/utils/stripe_service/models/payment_intent_input_model/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Errors, List<AddressModel>>> getAddresses();
  Future<Either<Errors, void>> makePayment(
      {required PaymentIntentInputModel model, required BuildContext context});
  Future<Either<Errors, StoreOrderOutputModel>> storeOrder(
      {required StoreAddressInputModel address});
  Future<Either<Errors, String>> deleteAddress({required int addressId});
}
