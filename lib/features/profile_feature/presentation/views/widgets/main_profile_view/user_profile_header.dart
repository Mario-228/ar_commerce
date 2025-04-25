import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/main_profile_view/user_profile_header_update_user_bloc_builder.dart';
import '../../../../data/models/profile_user_model.dart';

class UserPofileHeader extends StatelessWidget {
  const UserPofileHeader({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return UserProfileHeaderUpdateUserBlocBuilder(userModel: userModel);
  }
}
