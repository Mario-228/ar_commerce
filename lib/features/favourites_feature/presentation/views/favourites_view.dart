import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_appbar.dart';
import 'package:graduation_project/features/favourites_feature/presentation/views/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: "Favourites",
      ),
      body: FavouritesViewBody(),
    );
  }
}
