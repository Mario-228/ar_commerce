import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourite_states.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourites_cubit.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../home_feature/presentation/widgets/product_item_favourite_button.dart';
import 'item_counter.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
    required this.model,
    this.quantity,
  });
  final CustomProductItemModel model;
  final int? quantity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(model.name, style: FontStyles.textStyleRegular20),
            SizedBox(
              height: 35,
              width: 35,
              child:
                  BlocConsumer<GetUserFavouritesCubit, GetUserFavouriteStates>(
                listener: (BuildContext context, GetUserFavouriteStates state) {
                  if (state is GetUserFavouriteSuccess &&
                      GetUserFavouritesCubit.get(context).productItemModel.id ==
                          model.id) {
                    model.isFavorite = GetUserFavouritesCubit.get(context)
                        .productItemModel
                        .isFavorite;
                    log("success");
                  }
                },
                builder: (context, state) {
                  if (state is AddOrRemoveFavouriteLoading) {
                    return CircularProgressIndicator(
                      color: AppColors.glodenOrange,
                      strokeWidth: 2,
                    );
                  } else {
                    return ProductItemFavouriteButton(
                      onFavouritePressed: () async =>
                          await GetUserFavouritesCubit.get(context)
                              .addOrRemoveFavourite(productId: model.id),
                      isFavorite: model.isFavorite,
                    );
                  }
                },
              ),
            ),
          ],
        ),
        subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "${model.price}",
                style: FontStyles.textStyleSemiBold20
                    .copyWith(color: AppColors.glodenOrange),
              ),
              ItemCounter(model: model, quantity: quantity),
            ]),
      ),
    );
  }
}
