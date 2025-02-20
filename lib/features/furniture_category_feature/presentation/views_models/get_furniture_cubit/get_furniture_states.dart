import '../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class GetFurnitureStates {}

class GetFurnitureInitialState extends GetFurnitureStates {}

class GetFurnitureLoadingState extends GetFurnitureStates {}

class GetFurnitureSuccessState extends GetFurnitureStates {
  final List<CustomProductItemModel> furnitureProducts;
  GetFurnitureSuccessState({required this.furnitureProducts});
}

class GetFurnitureFailedState extends GetFurnitureStates {
  final String errorMsg;
  GetFurnitureFailedState({required this.errorMsg});
}
