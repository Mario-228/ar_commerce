import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo.dart';
import 'package:graduation_project/features/signup_feature/presentation/views_models/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;
  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> signUp(SignUpUserModel user) async {
    emit(SignUpLoading());
    var response = await signUpRepo.signUpUser(user);
    response.fold((error) {
      emit(SignUpError(error.errorMessage));
    }, (value) {
      emit(SignUpSuccess(user: value));
    });
  }
}
