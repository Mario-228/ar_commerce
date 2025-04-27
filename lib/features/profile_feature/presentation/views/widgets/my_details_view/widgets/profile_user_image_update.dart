import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/my_details_view/widgets/profile_image_bloc_builder.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/my_details_view/widgets/show_image_source_action_sheet.dart';
// import 'package:graduation_project/constants.dart';
import '../../../../../../../core/utils/app_colors/app_colors.dart';

class ProfileUserImageUpdate extends StatelessWidget {
  const ProfileUserImageUpdate({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ProfileImageBlocBuilder(),
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
}
