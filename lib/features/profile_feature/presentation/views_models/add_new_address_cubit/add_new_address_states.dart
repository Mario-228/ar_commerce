import '../../../../checkout_feature/data/models/address_model.dart';

abstract class AddNewAddressStates {}

class AddNewAddressInitialState extends AddNewAddressStates {}

class AddNewAddressLoadingState extends AddNewAddressStates {}

class AddNewAddressSuccessState extends AddNewAddressStates {
  AddressModel addressModel;
  AddNewAddressSuccessState({required this.addressModel});
}

class AddNewAddressErrorState extends AddNewAddressStates {
  String errorMessage;
  AddNewAddressErrorState({required this.errorMessage});
}
