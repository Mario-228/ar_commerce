import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/repos/delivery_address_repo/delivery_address_repo_implementation.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/add_new_address_cubit/add_new_address_states.dart';

class AddNewAddressCubit extends Cubit<AddNewAddressStates> {
  AddNewAddressCubit() : super(AddNewAddressInitialState());
  static AddNewAddressCubit get(context) => BlocProvider.of(context);
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController address = TextEditingController();
  static TextEditingController name = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController phone = TextEditingController();

  Future<void> addNewAddress() async {
    emit(AddNewAddressLoadingState());
    var response = await DeliveryAddressRepoImplementation()
        .addDeliveryAddress(AddressModel(
      address: address.text,
      receiverName: name.text,
      receiverEmail: email.text,
      phone: phone.text,
    ));
    response.fold(
        (error) =>
            emit(AddNewAddressErrorState(errorMessage: error.errorMessage)),
        (data) {
      emit(AddNewAddressSuccessState(addressModel: data));
    });
  }
}
