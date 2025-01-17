import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/custom_gender_selection_widget.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/my_details_input_fields_section.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/profile_user_image_update.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/update_user_info_bloc_builder.dart';

class MyDetailsViewBody extends StatelessWidget {
  const MyDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    GlobalKey<FormState> myDetailsFormKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: myDetailsFormKey,
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const ProfileUserImageUpdate(),
              const SizedBox(height: 10.0),
              MyDetailsInputFieldsSection(
                  nameController: nameController,
                  phoneController: phoneController),
              //if(model.geneder=="") this will be shown after passing the user model
              const SizedBox(height: 20.0),
              //if(model.geneder=="") this will be shown after passing the user model
              const CustomGenederSelectionWidget(),
              const SizedBox(height: 20.0),
              UpdateUserInfoButtonBlocBuilder(
                  myDetailsFormKey: myDetailsFormKey),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
