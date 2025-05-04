import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';

abstract class EditAddressStates {}

class EditAddressInitialState extends EditAddressStates {}

class EditAddressLoadingState extends EditAddressStates {}

class EditAddressSuccessState extends EditAddressStates {
  final AddressModel addressModel;
  EditAddressSuccessState({required this.addressModel});
}

class EditAddressErrorState extends EditAddressStates {
  final String error;
  EditAddressErrorState({required this.error});
}
