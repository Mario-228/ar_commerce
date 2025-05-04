import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/edit_address_user_model.dart';

abstract class EditAddressRepo {
  Future<Either<Errors, AddressModel>> editDeliveryAddress(
      EditAddressUserModel model, int addressId);
}
