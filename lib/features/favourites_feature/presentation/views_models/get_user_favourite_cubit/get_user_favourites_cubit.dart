import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views_models/get_user_favourite_cubit/get_user_favourite_states.dart';
import '../../../data/repos/favourites_repo_implementation.dart';

class GetUserFavouritesCubit extends Cubit<GetUserFavouriteStates> {
  GetUserFavouritesCubit() : super(GetUserFavouriteInitialState());

  static GetUserFavouritesCubit get(context) => BlocProvider.of(context);
  List<CustomProductItemModel> userFavourites = [];
  late CustomProductItemModel productItemModel;
  Future<void> getUserFavourites() async {
    emit(GetUserFavouriteLoading());
    var result = await FavouritesRepoImplementation().getUserFavourites();
    result.fold(
      (error) =>
          emit(GetUserFavouriteError(errorMessageFromApi: error.errorMessage)),
      (data) {
        userFavourites = data;
        emit(GetUserFavouriteSuccess(userFavouritesList: userFavourites));
      },
    );
  }

  Future<void> addOrRemoveFavourite({
    required int productId,
  }) async {
    emit(AddOrRemoveFavouriteLoading());
    var result = await FavouritesRepoImplementation()
        .removeOrAddFavourite(productId: productId);
    result.fold(
      (error) => emit(
          AddOrRemoveFavouriteError(errorMessageFromApi: error.errorMessage)),
      (data) async {
        productItemModel = data;
        await getUserFavourites();
      },
    );
  }
}
