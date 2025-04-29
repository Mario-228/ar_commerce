import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';

abstract class GetUserFavouriteStates {
  GetUserFavouriteStates();
}

class GetUserFavouriteInitialState extends GetUserFavouriteStates {}

class GetUserFavouriteLoading extends GetUserFavouriteStates {}

class GetUserFavouriteSuccess extends GetUserFavouriteStates {
  List<CustomProductItemModel> userFavouritesList;

  GetUserFavouriteSuccess({required this.userFavouritesList});
}

class GetUserFavouriteError extends GetUserFavouriteStates {
  final String errorMessageFromApi;

  GetUserFavouriteError({required this.errorMessageFromApi});
}

class AddOrRemoveFavouriteError extends GetUserFavouriteStates {
  final String errorMessageFromApi;

  AddOrRemoveFavouriteError({required this.errorMessageFromApi});
}

class AddOrRemoveFavouriteSuccess extends GetUserFavouriteStates {
  CustomProductItemModel productItemModel;

  AddOrRemoveFavouriteSuccess({required this.productItemModel});
}
