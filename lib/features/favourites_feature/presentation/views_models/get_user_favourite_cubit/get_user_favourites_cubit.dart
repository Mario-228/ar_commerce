import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourite_states.dart';
import '../../../data/repos/favourites_repo_implementation.dart';

class GetUserFavouritesCubit extends Cubit<GetUserFavouriteState> {
  GetUserFavouritesCubit() : super(const GetUserFavouriteState());

  static GetUserFavouritesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getUserFavourites() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await FavouritesRepoImplementation().getUserFavourites();
    result.fold(
      (error) => emit(state.copyWith(
        isLoading: false,
        errorMessage: error.errorMessage,
      )),
      (data) {
        final map = {for (var e in data) e.id: e.isFavorite};
        emit(state.copyWith(
          isLoading: false,
          favourites: data,
          favouritesMap: map,
          errorMessage: null,
          isUpdatingFavourite: false,
        ));
      },
    );
  }

  Future<void> addOrRemoveFavourite({required int productId}) async {
    emit(state.copyWith(isUpdatingFavourite: true, errorMessage: null));

    final result = await FavouritesRepoImplementation()
        .removeOrAddFavourite(productId: productId);

    result.fold(
      (error) => emit(state.copyWith(
        isUpdatingFavourite: false,
        errorMessage: error.errorMessage,
      )),
      (data) {
        final updatedMap = Map<int, bool>.from(state.favouritesMap);
        final updatedList = List<CustomProductItemModel>.from(state.favourites);

        final currentValue = updatedMap[productId] ?? false;
        updatedMap[productId] = !currentValue;

        if (!data.isFavorite) {
          updatedList.removeWhere((item) => item.id == productId);
        } else {
          updatedList.add(data);
        }

        emit(state.copyWith(
          isUpdatingFavourite: false,
          favourites: updatedList,
          favouritesMap: updatedMap,
          errorMessage: null,
          isLoading: false,
        ));
      },
    );
  }

  bool isFavourite(int productId) => state.favouritesMap[productId] ?? false;
}
