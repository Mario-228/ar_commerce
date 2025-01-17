import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/functions/pick_image.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUserImageUpdate extends StatelessWidget {
  const ProfileUserImageUpdate({
    super.key,
    required this.image,
  });
  final File image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: NetworkImage(userModel.imageUrl),
        ),
        IconButton(
          onPressed: () => showImageSourceActionSheet(context),
          icon: const Icon(Icons.camera_alt,
              size: 30.0, color: AppColors.darkGreen),
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
                pickImage(ImageSource.gallery).then((value) {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a Picture"),
              onTap: () {
                pickImage(ImageSource.gallery).then((value) {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
