import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';

abstract class GetOrderProfileStates {}

class GetOrderProfileInitialState extends GetOrderProfileStates {}

class GetOrderProfileSuccessState extends GetOrderProfileStates {
  final List<GetOrderModel> completedOrders;
  final List<GetOrderModel> pendingOrders;
  GetOrderProfileSuccessState(
      {required this.completedOrders, required this.pendingOrders});
}

class GetOrderProfileLoadingState extends GetOrderProfileStates {}

class GetOrderProfileErrorState extends GetOrderProfileStates {
  final String error;
  GetOrderProfileErrorState({required this.error});
}
