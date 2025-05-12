import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourite_states.dart';
import '../../../../favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourites_cubit.dart';
import '../../../../home_feature/presentation/widgets/product_item_favourite_button.dart';

class FavouriteButtonBlocBuilder extends StatelessWidget {
  const FavouriteButtonBlocBuilder({
    super.key,
    required this.model,
  });

  final CustomProductItemModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserFavouritesCubit, GetUserFavouriteState>(
      builder: (context, state) {
        final isFavorite = state.favouritesMap[model.id] ?? false;
        if (state.isUpdatingFavourite) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.glodenOrange,
            ),
          );
        } else {
          return ProductItemFavouriteButton(
            onFavouritePressed: () => context
                .read<GetUserFavouritesCubit>()
                .addOrRemoveFavourite(productId: model.id),
            isFavorite: isFavorite,
          );
        }
      },
    );
  }
}
