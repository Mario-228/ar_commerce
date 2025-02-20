import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../../core/utils/cache_helper/cache_helper_keys.dart';
import '../../../data/repos/email_verification_repo_implementation.dart';
import 'email_verification_states.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationStates> {
  EmailVerificationCubit() : super(EmailVerificationInitial());

  static EmailVerificationCubit get(BuildContext context) =>
      BlocProvider.of(context);
  Future<void> verificationEmail(String email, String otp) async {
    emit(EmailVerificationLoading());
    var result = await EmailVerificationRepoImplementation()
        .emailVerification(email, otp);
    result.fold(
      (error) => emit(EmailVerificationError(error.errorMessage)),
      (data) {
        emit(EmailVerificationSuccess(data));
        CacheHelper.saveData<bool>(CacheHelperKeys.isVerified, true);
      },
    );
  }
}
