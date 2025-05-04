import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';

import '../../../../../core/errors/errors.dart';

abstract class DeliveryAddressRepo {
  Future<Either<Errors, AddressModel>> addDeliveryAddress(
      AddressModel addressModel);
}
