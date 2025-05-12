import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';

@immutable
class GetUserFavouriteState extends Equatable {
  final bool isLoading;
  final bool isUpdatingFavourite;
  final String? errorMessage;
  final List<CustomProductItemModel> favourites;
  final Map<int, bool> favouritesMap;

  const GetUserFavouriteState({
    this.isLoading = false,
    this.isUpdatingFavourite = false,
    this.errorMessage,
    this.favourites = const [],
    this.favouritesMap = const {},
  });

  GetUserFavouriteState copyWith({
    bool? isLoading,
    bool? isUpdatingFavourite,
    String? errorMessage,
    List<CustomProductItemModel>? favourites,
    Map<int, bool>? favouritesMap,
  }) {
    return GetUserFavouriteState(
      isLoading: isLoading ?? this.isLoading,
      isUpdatingFavourite: isUpdatingFavourite ?? this.isUpdatingFavourite,
      errorMessage: errorMessage,
      favourites: favourites ?? this.favourites,
      favouritesMap: favouritesMap ?? this.favouritesMap,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isUpdatingFavourite,
        errorMessage,
        favourites,
        favouritesMap,
      ];
}
