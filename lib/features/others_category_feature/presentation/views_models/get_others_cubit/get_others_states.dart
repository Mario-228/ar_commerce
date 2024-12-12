import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class GetOthersStates {
  GetOthersStates();
}

class GetOthersInitialState extends GetOthersStates {
  GetOthersInitialState();
}

class GetOthersLoadingState extends GetOthersStates {
  GetOthersLoadingState();
}

class GetOthersSuccessState extends GetOthersStates {
  final List<CustomProductItemModel> productItems;
  GetOthersSuccessState({required this.productItems});
}

class GetOthersFailedState extends GetOthersStates {
  final String errorMsg;
  GetOthersFailedState({required this.errorMsg});
}
