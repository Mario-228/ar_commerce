import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/profile_user_image_update.dart';

class MyDetailsViewBody extends StatelessWidget {
  const MyDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 30.0),
          ProfileUserImageUpdate(),
        ],
      ),
    );
  }
}
