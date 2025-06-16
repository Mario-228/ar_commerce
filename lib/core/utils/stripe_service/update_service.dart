import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Either<Errors, String>> updateOrderStatus({
  required int orderId,
  required String transactionId,
}) async {
  try {
    var supabaseInstance = Supabase.instance.client;

    await supabaseInstance.from("orders").update({
      "status": "complete",
      "payment_method": "stripe",
      "transaction_id": transactionId,
      "updated_at": DateTime.now().toIso8601String(),
      "paid_at": DateTime.now().toIso8601String(),
    }).eq("id", orderId);

    return right("Success");
  } on Exception catch (e) {
    log(e.toString());
    return left(ServerError.fromDioError(e));
  }
}
