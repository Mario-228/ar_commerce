import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/repos/orders_profile_repo/orders_profile_repo.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/repos/orders_profile_repo/orders_profile_repo_endpoints.dart';

class OrderProfileRepoImplementation implements OrdersProfileRepo {
  @override
  Future<Either<Errors, List<GetOrderModel>>> getOrders() async {
    try {
      var response = await ApiService(BaseUrl.authentication).getWithToken(
          OrdersProfileRepoEndpoints.orders, CacheHelper.getUserData().token);

      List<GetOrderModel> orders = [];
      for (var order in response['order']) {
        orders.add(GetOrderModel.fromJson(order));
      }
      if (response['order'] == []) {
        log('empty order');
      }
      return right(orders);
    } catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }
}
