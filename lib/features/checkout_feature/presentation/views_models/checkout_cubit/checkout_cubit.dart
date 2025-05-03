import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/repos/checkout_repo_implementation.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_states.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit() : super(CheckoutInitialState());

  static CheckoutCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController nameController =
      TextEditingController(text: "Receiver Name");
  TextEditingController emailController =
      TextEditingController(text: "Receiver Email");
  TextEditingController addressController =
      TextEditingController(text: "Receiver phone number");
  TextEditingController phoneController =
      TextEditingController(text: "Receiver Address");
  Future<void> getAddresses() async {
    emit(CheckoutLoadingState());
    var result = await CheckoutRepoImplementation().getAddresses();
    result.fold(
      (onError) => emit(CheckoutErrorState(error: onError.errorMessage)),
      (onSuccess) => emit(CheckoutSuccessState(addresses: onSuccess)),
    );
  }
}
