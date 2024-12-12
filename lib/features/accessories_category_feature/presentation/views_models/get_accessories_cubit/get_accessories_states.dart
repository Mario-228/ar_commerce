import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class GetAccessoriesStates {
  GetAccessoriesStates();
}

class GetAccessoriesInitialState extends GetAccessoriesStates {
  GetAccessoriesInitialState();
}

class GetAccessoriesLoadingState extends GetAccessoriesStates {
  GetAccessoriesLoadingState();
}

class GetAccessoriesSuccessState extends GetAccessoriesStates {
  List<CustomProductItemModel> accessoriesProducts;
  GetAccessoriesSuccessState({required this.accessoriesProducts});
}

class GetAccessoriesFailedState extends GetAccessoriesStates {
  final String errorMsg;
  GetAccessoriesFailedState({required this.errorMsg});
}
