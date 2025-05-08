import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/store_address_input_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/repos/checkout_repo_implementation.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_states.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutState());

  static CheckoutCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController nameController =
      TextEditingController(text: "Receiver Name");
  TextEditingController emailController =
      TextEditingController(text: "Receiver Email");
  TextEditingController addressController =
      TextEditingController(text: "Receiver Address");
  TextEditingController phoneController =
      TextEditingController(text: "Receiver phone number");
  Future<void> getAddresses() async {
    emit(state.copyWith(
        isGetAddressLoading: true,
        getAddressesSuccessState: null,
        getAddressesErrorState: null));
    var result = await CheckoutRepoImplementation().getAddresses();
    result.fold(
      (onError) => emit(state.copyWith(
          isGetAddressLoading: false,
          getAddressesErrorState: onError.errorMessage)),
      (onSuccess) => emit(state.copyWith(
          isGetAddressLoading: false, getAddressesSuccessState: onSuccess)),
    );
  }

  Future<void> storeOrder() async {
    emit(state.copyWith(
      isOrderLoading: true,
      storeOrderErrorState: null,
      storeOrderSuccessState: null,
    ));
    StoreAddressInputModel address = StoreAddressInputModel(
      address: addressController.text,
      email: emailController.text,
      name: nameController.text,
      phone: phoneController.text,
      note: null,
    );
    if (address.name == 'Receiver Name' ||
        address.email == 'Receiver Email' ||
        address.address == 'Receiver Address' ||
        address.phone == 'Receiver phone number') {
      emit(state.copyWith(
          isOrderLoading: false,
          storeOrderErrorState: 'Please Select Delivery State'));
      return;
    }
    var result =
        await CheckoutRepoImplementation().storeOrder(address: address);
    result.fold(
      (onError) => emit(state.copyWith(
          isOrderLoading: false, storeOrderErrorState: onError.errorMessage)),
      (onSuccess) {
        log(onSuccess.order.id.toString());
        emit(state.copyWith(
            isOrderLoading: false, storeOrderSuccessState: onSuccess));
      },
    );
  }
}
