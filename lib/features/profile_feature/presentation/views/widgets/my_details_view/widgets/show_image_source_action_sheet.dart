import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/utils/functions/pick_image.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/update_user_cubit/update_user_cubit.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../../../../../core/utils/cache_helper/cache_helper.dart';
// import '../../../../../../../core/utils/functions/pick_image.dart';
// import '../../../../../../../core/utils/functions/show_snack_bar.dart';
// import '../../../../views_models/update_user_cubit/update_user_cubit.dart';
// import '../../../../views_models/update_user_cubit/update_user_states.dart';

Future<void> showImageSourceActionSheet(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from Gallery'),
            onTap: () {
              pickImage(ImageSource.gallery).then((fileValue) {
                if (context.mounted) {
                  UpdateUserCubit.get(context).image = fileValue;
                }
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Take a Picture"),
            onTap: () {
              pickImage(ImageSource.camera).then((fileValue) {
                if (context.mounted) {
                  UpdateUserCubit.get(context).image = fileValue;
                }
              });
            },
          ),
        ],
      );
    },
  );
}
// pickImage(ImageSource.gallery).then((fileValue) async {
//   CacheHelper.saveUserImage(fileValue).then((voidValue) async {
//     if (context.mounted) {
//       await UpdateUserCubit.get(context).updateUser();
//     }
//   });
// });

// pickImage(ImageSource.camera).then((fileValue) async {
//   CacheHelper.saveUserImage(fileValue).then((voidValue) async {
//     if (context.mounted) {
//       await UpdateUserCubit.get(context).updateUser();
//     }
//   });
// });
