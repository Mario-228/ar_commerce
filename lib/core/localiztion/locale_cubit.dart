import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));
  static LocaleCubit get(context) => BlocProvider.of(context);
  static String languageCode = 'en';
  void toggleLocale() {
    if (state.languageCode == 'en') {
      languageCode = 'ar';
      emit(const Locale('ar'));
    } else {
      languageCode = 'en';
      emit(const Locale('en'));
    }
  }
}
