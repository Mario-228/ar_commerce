import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';

abstract class GetOrderProfileStates {
  const GetOrderProfileStates();
}

class GetOrderProfileInitialState extends GetOrderProfileStates {
  const GetOrderProfileInitialState();
}

class GetOrderProfileSuccessState extends GetOrderProfileStates {
  final List<GetOrderModel> completedOrders;
  final List<GetOrderModel> pendingOrders;
  const GetOrderProfileSuccessState(
      {required this.completedOrders, required this.pendingOrders});
}

class GetOrderProfileErrorState extends GetOrderProfileStates {
  final String error;
  const GetOrderProfileErrorState(this.error);
}
