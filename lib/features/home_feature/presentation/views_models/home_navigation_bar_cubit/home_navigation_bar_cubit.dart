import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_navigation_bar_states.dart';

class HomeNavigationBarCubit extends Cubit<HomeNavigationBarStates> {
  HomeNavigationBarCubit() : super(HomeNavigationBarInitial());

  static HomeNavigationBarCubit get(BuildContext context) =>
      BlocProvider.of(context);

  int selectedIndex = 0;
  void changeIndex(int index) {
    selectedIndex = index;
    emit(HomeNavigationBarChangeIndex());
  }
}
