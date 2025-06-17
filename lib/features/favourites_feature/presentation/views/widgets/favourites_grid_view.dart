import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourite_states.dart';
import 'package:graduation_project_new_version/features/home_feature/presentation/widgets/custom_product_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../views_models/get_user_favourite_cubit/get_user_favourites_cubit.dart';

class FavouritesGridView extends StatelessWidget {
  const FavouritesGridView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<GetUserFavouritesCubit, GetUserFavouriteState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.favourites.isEmpty) {
            return Center(
                child: Text(AppLocalizations.of(context)!.noFavoritesYet));
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.favourites.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) => CustomProductItem(
                productItemModel: state.favourites[index],
              ),
            );
          }
        },
      ),
    );
  }
}
