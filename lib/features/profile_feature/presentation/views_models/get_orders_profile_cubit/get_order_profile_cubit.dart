import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_orders_profile_cubit/get_order_profile_states.dart';

import '../../../data/repos/orders_profile_repo/order_profile_repo_implementation.dart';

class GetOrderProfileCubit extends Cubit<GetOrderProfileStates> {
  GetOrderProfileCubit() : super(GetOrderProfileInitialState());
  static GetOrderProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getOrders() async {
    emit(GetOrderProfileInitialState());
    var result = await OrderProfileRepoImplementation().getOrders();
    result.fold(
      (error) => emit(GetOrderProfileErrorState(error.toString())),
      (order) {
        List<GetOrderModel> pendingOrders = [];
        List<GetOrderModel> completedOrders = [];
        for (GetOrderModel value in order) {
          if (value.status == 'complete') {
            completedOrders.add(value);
          } else {
            pendingOrders.add(value);
          }
        }
        emit(GetOrderProfileSuccessState(
            completedOrders: completedOrders, pendingOrders: pendingOrders));
      },
    );
  }
}
