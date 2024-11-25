import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home_feature/presentation/views_models/home_navigation_bar_cubit/home_navigation_bar_states.dart';

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
