import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/repos/delivery_address_repo/delivery_address_endpoints.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/repos/delivery_address_repo/delivery_address_repo.dart';

import '../../../../../core/utils/api_service/base_url.dart';

class DeliveryAddressRepoImplementation implements DeliveryAddressRepo {
  @override
  Future<Either<Errors, AddressModel>> addDeliveryAddress(
      AddressModel addressModel) async {
    try {
      var result = await ApiService(BaseUrl.authentication)
          .postDataWithTokenAndQuery(
              endPoint: DeliveryAddressEndpoints.addDeliveryAddress,
              token: CacheHelper.getUserData().token,
              data: addressModel.toJson());
      AddressModel address = AddressModel.fromJson(result['address']);

      log(address.toString());
      return right(address);
    } catch (e) {
      return left(
        ServerError.fromDioError(e),
      );
    }
  }
}
