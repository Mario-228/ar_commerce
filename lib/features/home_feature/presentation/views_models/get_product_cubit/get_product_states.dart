import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';

abstract class GetProductStates {
  GetProductStates();
}

class GetProductInitialState extends GetProductStates {
  GetProductInitialState();
}

class GetProductLoadingState extends GetProductStates {}

class GetProductSuccessState extends GetProductStates {
  List<CustomProductItemModel> productItems;

  GetProductSuccessState({required this.productItems});
}

class GetProductErrorState extends GetProductStates {
  final String errorMessageFromApi;

  GetProductErrorState({required this.errorMessageFromApi});
}
