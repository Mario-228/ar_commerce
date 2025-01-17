import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/core/utils/functions/convert_asset_image_to_file.dart';
import 'package:graduation_project/features/profile_feature/data/models/update_profile_model.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/custom_gender_selection_widget.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/my_details_input_fields_section.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/profile_user_image_update.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/update_user_info_bloc_builder.dart';

class MyDetailsViewBody extends StatelessWidget {
  const MyDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: userModel.userModel.name);
    TextEditingController phoneController =
        TextEditingController(text: userModel.userModel.phone);
    GlobalKey<FormState> myDetailsFormKey = GlobalKey<FormState>();
    File imageFile = File('');
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: myDetailsFormKey,
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              ProfileUserImageUpdate(image: imageFile),
              const SizedBox(height: 10.0),
              MyDetailsInputFieldsSection(
                  nameController: nameController,
                  phoneController: phoneController),
              if (userModel.userModel.gender == "")
                const SizedBox(height: 20.0),
              if (userModel.userModel.gender == "")
                const CustomGenederSelectionWidget(),
              const SizedBox(height: 20.0),
              UpdateUserInfoButtonBlocBuilder(
                  profileModel: getUserUpdateInformation(
                    nameController,
                    phoneController,
                    imageFile,
                  ),
                  myDetailsFormKey: myDetailsFormKey),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

Future<UpdateProfileModel> getUserUpdateInformation(
    TextEditingController nameController,
    TextEditingController phoneController,
    File imageFile) async {
  if (imageFile.path.isEmpty) {
    // imageFile = await convertAssetImageToFile(
    //     "assets/images/user_default_image.jpg", 'default_user_image.png');
    //imageFile=
  }
  var updateProfileModel = UpdateProfileModel(
      name: nameController.text.isEmpty
          ? userModel.userModel.name
          : nameController.text,
      phone: phoneController.text.isEmpty
          ? userModel.userModel.phone
          : phoneController.text,
      image: imageFile,
      gender: CustomGenederSelectionWidget.gender.isEmpty
          ? userModel.userModel.gender
          : CustomGenederSelectionWidget.gender);
  return updateProfileModel;
}
