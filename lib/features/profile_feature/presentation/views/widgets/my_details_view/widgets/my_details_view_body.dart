import 'package:flutter/material.dart';
import '../../../../views_models/update_user_cubit/update_user_cubit.dart';
import 'my_details_input_fields_section.dart';
import 'profile_user_image_update.dart';
import 'update_user_info_bloc_builder.dart';

class MyDetailsViewBody extends StatelessWidget {
  const MyDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: UpdateUserCubit.get(context).myDetailsFormKey,
          child: const Column(
            children: [
              SizedBox(height: 30.0),
              ProfileUserImageUpdate(),
              SizedBox(height: 10.0),
              MyDetailsInputFieldsSection(),
              SizedBox(height: 20.0),
              UpdateUserInfoButtonBlocBuilder(),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
