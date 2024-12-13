import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class GetFurnitureStates {
  GetFurnitureStates();
}

class GetFurnitureInitialState extends GetFurnitureStates {
  GetFurnitureInitialState();
}

class GetFurnitureLoadingState extends GetFurnitureStates {
  GetFurnitureLoadingState();
}

class GetFurnitureSuccessState extends GetFurnitureStates {
  final List<CustomProductItemModel> furnitureProducts;
  GetFurnitureSuccessState({required this.furnitureProducts});
}

class GetFurnitureFailedState extends GetFurnitureStates {
  final String errorMsg;
  GetFurnitureFailedState({required this.errorMsg});
}
