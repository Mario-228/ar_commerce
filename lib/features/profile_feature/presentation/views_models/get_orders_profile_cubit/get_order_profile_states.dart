import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';

abstract class GetOrderProfileStates {
  const GetOrderProfileStates();
}

class GetOrderProfileInitialState extends GetOrderProfileStates {
  const GetOrderProfileInitialState();
}

class GetOrderProfileSuccessState extends GetOrderProfileStates {
  final GetOrderModel order;
  const GetOrderProfileSuccessState(this.order);
}

class GetOrderProfileErrorState extends GetOrderProfileStates {
  final String error;
  const GetOrderProfileErrorState(this.error);
}
