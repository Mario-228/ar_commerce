import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/core/utils/payment_to_api/payment_end_points.dart';

abstract class PaymentToApi {
  static Future<Either<Errors, String>> paymentToApi(
      {required String transactionId,
      required String paymentMethod,
      required int orderID}) async {
    try {
      var response = await ApiService(BaseUrl.authentication)
          .postDataWithTokenAndQuery(
              endPoint: PaymentEndPoints.payment + orderID.toString(),
              data: {
                "transaction_id": transactionId,
                "payment_method": paymentMethod
              },
              token: CacheHelper.getUserData().token);
      return right(response['message']);
    } on Exception catch (_) {
      return left(ServerError(errorMessage: "Payment Failed"));
    }
  }
}
