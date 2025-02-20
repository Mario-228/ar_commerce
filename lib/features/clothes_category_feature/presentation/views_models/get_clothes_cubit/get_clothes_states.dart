import '../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class GetClothesStates {}

class GetClothesInitialState extends GetClothesStates {}

class GetClothesLoadingState extends GetClothesStates {}

class GetClothesSuccessState extends GetClothesStates {
  List<CustomProductItemModel> clothesProducts;
  GetClothesSuccessState({required this.clothesProducts});
}

class GetClothesFailedState extends GetClothesStates {
  final String errorMsg;
  GetClothesFailedState({required this.errorMsg});
}
