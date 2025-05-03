import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/repos/checkout_endpoints.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/repos/checkout_repo.dart';

import '../../../../core/errors/errors.dart';
import '../models/address_model.dart';

class CheckoutRepoImplementation implements CheckoutRepo {
  @override
  Future<Either<Errors, List<AddressModel>>> getAddresses() async {
    try {
      var response = await ApiService(BaseUrl.authentication).get(
          CheckoutEndpoints.checkout,
          token: CacheHelper.getUserData().token);
      List<AddressModel> addresses = [];
      response['address'].forEach((element) {
        addresses.add(AddressModel.fromJson(element));
      });
      return right(addresses);
    } on Exception catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }
}
