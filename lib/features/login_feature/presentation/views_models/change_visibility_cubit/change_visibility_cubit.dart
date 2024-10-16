import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/login_feature/presentation/views_models/change_visibility_cubit/change_visibility_states.dart';

class ChangeVisibilityCubit extends Cubit<ChangeVisibilityStates> {
  ChangeVisibilityCubit() : super(ChangeVisibilityInitialState());
  static ChangeVisibilityCubit get(BuildContext context) =>
      BlocProvider.of(context);

  bool isVisible = true;
  IconData eye = Icons.visibility_off;
  void changeLoginVisibility() {
    isVisible = !isVisible;
    if (isVisible) {
      eye = Icons.visibility_off;
    } else {
      eye = Icons.visibility;
    }
    emit(VisibilityChangedState());
  }
}
