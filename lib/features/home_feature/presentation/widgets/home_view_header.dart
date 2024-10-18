import 'package:flutter/material.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_background_container.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/stack_header_content.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        HomeBackgroundContainer(),
        StackHeaderContent(),
      ],
    );
  }
}
