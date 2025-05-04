import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';

abstract class GetSearchProductsStates {
  const GetSearchProductsStates();
}

class GetSearchProductsInitialState extends GetSearchProductsStates {}

class GetSearchProductsLoadingState extends GetSearchProductsStates {}

class GetSearchProductsSuccessState extends GetSearchProductsStates {
  final List<CustomProductItemModel> products;
  const GetSearchProductsSuccessState({required this.products});
}

class GetSearchProductsFailedState extends GetSearchProductsStates {
  final String errorMsg;
  const GetSearchProductsFailedState({required this.errorMsg});
}
