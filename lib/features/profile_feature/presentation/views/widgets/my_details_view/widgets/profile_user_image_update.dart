import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/update_user_cubit/update_user_states.dart';
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
          onPressed: () async => await showImageSourceActionSheet(context),
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
            BlocListener<UpdateUserCubit, UpdateUserStates>(
              listener: (context, state) {
                if (state is UpdateUserSuccessState) {
                  Navigator.pop(context);
                }
                if (state is UpdateUserErrorState) {
                  showSnackBar(context, state.errorMessage);
                }
              },
              child: ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () async {
                  pickImage(ImageSource.gallery).then((fileValue) async {
                    CacheHelper.saveUserImage(fileValue)
                        .then((voidValue) async {
                      if (context.mounted) {
                        await UpdateUserCubit.get(context).updateUser();
                      }
                    });
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a Picture"),
              onTap: () async {
                pickImage(ImageSource.camera).then((fileValue) async {
                  CacheHelper.saveUserImage(fileValue).then((voidValue) async {
                    if (context.mounted) {
                      await UpdateUserCubit.get(context).updateUser();
                    }
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
