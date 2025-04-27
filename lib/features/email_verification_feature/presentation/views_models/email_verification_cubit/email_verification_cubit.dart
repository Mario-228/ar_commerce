import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/constants.dart';
import '../../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../../core/utils/cache_helper/cache_helper_keys.dart';
import '../../../data/repos/email_verification_repo_implementation.dart';
import 'email_verification_states.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationStates> {
  EmailVerificationCubit() : super(EmailVerificationInitial());

  static EmailVerificationCubit get(BuildContext context) =>
      BlocProvider.of(context);
  String otp = '';
  Future<void> verificationEmail() async {
    emit(EmailVerificationLoading());
    var result = await EmailVerificationRepoImplementation()
        .emailVerification(userEmail, otp);
    result.fold(
      (error) => emit(EmailVerificationError(error.errorMessage)),
      (data) {
        emit(EmailVerificationSuccess(data));
        CacheHelper.saveData<bool>(CacheHelperKeys.isVerified, true);
      },
    );
  }
}
