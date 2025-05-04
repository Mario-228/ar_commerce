import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/edit_address_user_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/repos/edit_address_repo/edit_address_end_points.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/repos/edit_address_repo/edit_address_repo.dart';

class EditAddressRepoImplementation implements EditAddressRepo {
  @override
  Future<Either<Errors, AddressModel>> editDeliveryAddress(
      EditAddressUserModel model, int addressId) async {
    try {
      var response = await ApiService(BaseUrl.authentication).putData(
        endPoint:
            EditAddressEndPoints.editDeliveryAddress + addressId.toString(),
        token: CacheHelper.getUserData().token,
        data: model.toJson(),
      );
      return right(AddressModel.fromJson(response['address']));
    } on Exception catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }
}
