import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';

class UserPofileHeader extends StatelessWidget {
  const UserPofileHeader({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 37.5,
          backgroundImage: NetworkImage(userModel.imageUrl),
        ),
        const SizedBox(width: 25.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userModel.userModel.name,
              style: FontStyles.textStyleRegular16,
            ),
            const SizedBox(height: 10.0),
            Text(
              userModel.userModel.email,
              style: FontStyles.textStyleRegularGrey14,
            ),
            const SizedBox(height: 10.0),
          ],
        )
      ],
    );
  }
}
