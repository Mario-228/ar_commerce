import 'package:flutter/material.dart';
import 'home_background_container.dart';
import 'stack_header_content.dart';

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
