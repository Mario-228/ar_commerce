import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/widgets/custom_appbar.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views/widgets/favourites_view_body.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourites_cubit.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Favourites",
      ),
      body: BlocProvider(
        create: (context) => GetUserFavouritesCubit()..getUserFavourites(),
        child: FavouritesViewBody(),
      ),
    );
  }
}
