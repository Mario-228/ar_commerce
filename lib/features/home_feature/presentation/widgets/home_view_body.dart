import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_categories_list.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_view_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeViewHeader(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 40.0),
              HomeCategoriesList(),
            ],
          ),
        )
      ],
    );
  }
}
