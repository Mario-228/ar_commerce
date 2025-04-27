import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';

abstract class GetAccessoriesStates {}

class GetAccessoriesInitialState extends GetAccessoriesStates {}

class GetAccessoriesLoadingState extends GetAccessoriesStates {}

class GetAccessoriesSuccessState extends GetAccessoriesStates {
  List<CustomProductItemModel> accessoriesProducts;
  GetAccessoriesSuccessState({required this.accessoriesProducts});
}

class GetAccessoriesFailedState extends GetAccessoriesStates {
  final String errorMsg;
  GetAccessoriesFailedState({required this.errorMsg});
}
