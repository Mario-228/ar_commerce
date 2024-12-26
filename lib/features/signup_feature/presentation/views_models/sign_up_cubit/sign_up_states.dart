import 'package:graduation_project/features/signup_feature/data/models/sign_up_response.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {
  final SignUpResponse user;
  SignUpSuccess({required this.user});
}

class SignUpError extends SignUpStates {
  final String error;
  SignUpError(this.error);
}
