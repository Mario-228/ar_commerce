import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';

import '../../../data/models/store_order_output_model.dart';

class CheckoutState {
  final bool isGetAddressLoading;
  final String? getAddressesErrorState;
  final List<AddressModel>? getAddressesSuccessState;
  final StoreOrderOutputModel? storeOrderSuccessState;
  final bool isOrderLoading;
  final String? storeOrderErrorState;

  CheckoutState({
    this.isGetAddressLoading = false,
    this.getAddressesErrorState,
    this.getAddressesSuccessState,
    this.storeOrderSuccessState,
    this.isOrderLoading = false,
    this.storeOrderErrorState,
  });

  CheckoutState copyWith({
    bool? isGetAddressLoading,
    String? getAddressesErrorState,
    List<AddressModel>? getAddressesSuccessState,
    StoreOrderOutputModel? storeOrderSuccessState,
    bool? isOrderLoading,
    String? storeOrderErrorState,
  }) {
    return CheckoutState(
      isGetAddressLoading: isGetAddressLoading ?? this.isGetAddressLoading,
      getAddressesErrorState: getAddressesErrorState,
      getAddressesSuccessState:
          getAddressesSuccessState ?? this.getAddressesSuccessState,
      storeOrderSuccessState:
          storeOrderSuccessState ?? this.storeOrderSuccessState,
      isOrderLoading: isOrderLoading ?? this.isOrderLoading,
      storeOrderErrorState: storeOrderErrorState,
    );
  }
}
