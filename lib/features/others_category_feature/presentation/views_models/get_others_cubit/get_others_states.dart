import '../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class GetOthersStates {}

class GetOthersInitialState extends GetOthersStates {}

class GetOthersLoadingState extends GetOthersStates {}

class GetOthersSuccessState extends GetOthersStates {
  final List<CustomProductItemModel> productItems;
  GetOthersSuccessState({required this.productItems});
}

class GetOthersFailedState extends GetOthersStates {
  final String errorMsg;
  GetOthersFailedState({required this.errorMsg});
}
