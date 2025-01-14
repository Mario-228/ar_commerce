import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_custom_button_bloc_builder.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_information_list_view.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/user_profile_header_bloc_builder.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30.0),
            UserProfileHeaderBlocBuilder(),
            SizedBox(height: 50.0),
            ProfileInformationListView(),
            SizedBox(height: 60.0),
            ProfileCustomButtonBlocConsumer()
          ],
        ),
      ),
    );
  }
}
