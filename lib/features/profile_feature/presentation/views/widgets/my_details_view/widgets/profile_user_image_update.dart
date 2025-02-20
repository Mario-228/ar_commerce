import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/constants.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../../../../core/utils/functions/pick_image.dart';
import '../../../../../data/models/profile_user_model.dart';
import '../../../../views_models/update_user_cubit/update_user_cubit.dart';

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
        return BlocProvider(
          create: (context) => UpdateUserCubit(),
          child: Wrap(
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
          ),
        );
      },
    );
  }
}
