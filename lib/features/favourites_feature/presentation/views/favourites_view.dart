import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/widgets/custom_appbar.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Favourites",
      ),
      body: FavouritesViewBody(),
    );
  }
}
