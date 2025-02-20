import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../constants.dart';
import '../../../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../views_models/update_user_cubit/update_user_cubit.dart';
import '../../../../views_models/update_user_cubit/update_user_states.dart';
import 'custom_gender_selection_widget.dart';
import 'my_details_input_fields_section.dart';
import 'profile_user_image_update.dart';
import 'update_user_info_bloc_builder.dart';

class MyDetailsViewBody extends StatelessWidget {
  const MyDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: userModel.userModel.name);
    TextEditingController phoneController =
        TextEditingController(text: userModel.userModel.phone);
    GlobalKey<FormState> myDetailsFormKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: myDetailsFormKey,
          child: BlocProvider(
            create: (context) => UpdateUserCubit(),
            child: BlocConsumer<UpdateUserCubit, UpdateUserStates>(
                listener: (context, state) {
              if (state is UpdateUserSuccessState) {
                showSnackBar(context, "Updated successfully");
                userModel = state.userModel;
                GoRouter.of(context).pop();
              }
              if (state is UpdateUserErrorState) {
                showSnackBar(context, state.errorMessage);
              }
            }, builder: (context, state) {
              if (state is UpdateUserLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return CustomUserUpdateBlocBuilder(
                  nameController: nameController,
                  phoneController: phoneController,
                  myDetailsFormKey: myDetailsFormKey,
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

class CustomUserUpdateBlocBuilder extends StatelessWidget {
  const CustomUserUpdateBlocBuilder({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.myDetailsFormKey,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> myDetailsFormKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30.0),
        ProfileUserImageUpdate(userModel: userModel),
        const SizedBox(height: 10.0),
        MyDetailsInputFieldsSection(userModel: userModel),
        if (userModel.userModel.gender == "") const SizedBox(height: 20.0),
        if (userModel.userModel.gender == "")
          const CustomGenederSelectionWidget(),
        const SizedBox(height: 20.0),
        UpdateUserInfoButtonBlocBuilder(myDetailsFormKey: myDetailsFormKey),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
