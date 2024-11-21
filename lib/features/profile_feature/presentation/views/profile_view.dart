import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/profile_app_bar.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileAppBar(title: "Profile"),
      body: ProfileViewBody(),
    );
  }
}
