import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {
  final AuthResponse authResponse;
  SignUpSuccess({required this.authResponse});
}

class SignUpError extends SignUpStates {
  final String error;
  SignUpError(this.error);
}
