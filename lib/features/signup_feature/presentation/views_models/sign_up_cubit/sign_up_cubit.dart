import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/functions/convert_asset_image_to_file.dart';
import 'package:graduation_project_new_version/features/signup_feature/data/models/sign_up_user_model.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import '../../../data/repo/sign_up_repo.dart';
import 'sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;
  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final RadioGroupController genderController = RadioGroupController();
  late SignUpInputModel user;
  Future<void> signUp() async {
    emit(SignUpLoading());
    user = SignUpInputModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      image: await convertAssetImageToFile(
          'assets/images/user_default_image.jpg', 'default_user_image.png'),
      phone: phoneController.text,
      gender: genderController.value,
    );
    var response = await signUpRepo.signUpUser(user);
    response.fold((error) {
      emit(SignUpError(error.errorMessage));
    }, (value) {
      emit(SignUpSuccess(message: value));
    });
  }
}
