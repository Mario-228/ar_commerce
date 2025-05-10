import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';

abstract class OrdersProfileRepo {
  Future<Either<Errors, List<GetOrderModel>>> getOrders();
  Future<Either<Errors, String>> deleteOrder({required int orderId});
}
