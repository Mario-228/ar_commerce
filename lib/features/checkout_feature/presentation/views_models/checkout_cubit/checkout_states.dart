import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';

abstract class CheckoutStates {}

class CheckoutInitialState extends CheckoutStates {}

class CheckoutLoadingState extends CheckoutStates {}

class CheckoutSuccessState extends CheckoutStates {
  final List<AddressModel> addresses;
  CheckoutSuccessState({required this.addresses});
}

class CheckoutErrorState extends CheckoutStates {
  final String error;
  CheckoutErrorState({required this.error});
}
