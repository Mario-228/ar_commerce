import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/edit_address_user_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/repos/edit_address_repo/edit_address_repo_implementation.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/edit_address_cubit/edit_address_states.dart';

class EditAddressCubit extends Cubit<EditAddressStates> {
  EditAddressCubit() : super(EditAddressInitialState());

  static EditAddressCubit get(BuildContext context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String email = "";
  void changeTextEditingControllers(AddressModel address) {
    addressController.text = address.address;
    nameController.text = address.receiverName;
    emailController.text = address.receiverEmail;
    phoneController.text = address.phone;
    email = address.receiverEmail;
  }

  Future<void> editAddress({required int addressId}) async {
    emit(EditAddressLoadingState());
    EditAddressUserModel model = EditAddressUserModel(
      address: addressController.text,
      receiverName: nameController.text,
      receiverEmail:
          (email != emailController.text) ? emailController.text : null,
      phone: phoneController.text,
    );
    log("data before sending : ${model.toJson().toString()}");
    var response = await EditAddressRepoImplementation().editDeliveryAddress(
      model,
      addressId,
    );
    response.fold(
        (error) => emit(EditAddressErrorState(error: error.errorMessage)),
        (data) => emit(EditAddressSuccessState(addressModel: data)));
  }
}
