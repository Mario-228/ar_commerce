import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/home_feature/presentation/widgets/product_item_favourite_button.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourite_states.dart';
import '../../../favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourites_cubit.dart';

class FavouriteButtonBlocBuilderFromHome extends StatelessWidget {
  const FavouriteButtonBlocBuilderFromHome({
    super.key,
    required this.productItemModel,
  });

  final CustomProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserFavouritesCubit, GetUserFavouriteState>(
      builder: (context, state) {
        final isFavorite = state.favouritesMap[productItemModel.id] ?? false;

        return ProductItemFavouriteButton(
          onFavouritePressed: () {
            context
                .read<GetUserFavouritesCubit>()
                .addOrRemoveFavourite(productId: productItemModel.id);
          },
          isFavorite: isFavorite,
        );
      },
    );
  }
}
