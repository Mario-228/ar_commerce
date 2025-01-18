import 'package:flutter/material.dart';
// import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/utils/functions/pick_image.dart';
import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/update_user_cubit/update_user_cubit.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUserImageUpdate extends StatelessWidget {
  const ProfileUserImageUpdate({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: NetworkImage(
              UpdateUserCubit.get(context).userModelCubit.imageUrl),
        ),
        IconButton(
          onPressed: () => showImageSourceActionSheet(context),
          icon: const Icon(
            Icons.camera_alt,
            size: 30.0,
            color: AppColors.darkGreen,
          ),
        )
      ],
    );
  }

  Future<void> showImageSourceActionSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () async {
                pickImage(ImageSource.gallery).then((fileValue) async {
                  CacheHelper.saveUserImage(fileValue).then((voidValue) {
                    UpdateUserCubit.get(context).userProfileModel.image =
                        fileValue;
                    Navigator.pop(context);
                  });
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a Picture"),
              onTap: () async {
                pickImage(ImageSource.camera).then((fileValue) async {
                  CacheHelper.saveUserImage(fileValue).then((voidValue) {
                    UpdateUserCubit.get(context).userProfileModel.image =
                        fileValue;
                    Navigator.pop(context);
                  });
                });
              },
            ),
          ],
        );
      },
    );
  }
}
