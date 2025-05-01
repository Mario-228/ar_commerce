import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/home_feature/presentation/widgets/product_item_favourite_button.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourite_states.dart';
import '../../../favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourites_cubit.dart';

class FavouriteButtonBlocBuilder extends StatelessWidget {
  const FavouriteButtonBlocBuilder({
    super.key,
    required this.productItemModel,
  });

  final CustomProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserFavouritesCubit, GetUserFavouriteStates>(
      listener: (context, state) {
        if ((state is AddOrRemoveFavouriteSuccess) &&
            (state.productItemModel.id == productItemModel.id)) {
          productItemModel.isFavorite = state.productItemModel.isFavorite;
        }
      },
      builder: (context, state) {
        return ProductItemFavouriteButton(
          onFavouritePressed: () async =>
              await GetUserFavouritesCubit.get(context)
                  .addOrRemoveFavourite(productId: productItemModel.id),
          isFavorite: productItemModel.isFavorite,
        );
      },
    );
  }
}
