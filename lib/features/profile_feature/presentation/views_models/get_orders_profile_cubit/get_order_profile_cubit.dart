import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/get_orders_profile_cubit/get_order_profile_states.dart';
import '../../../data/repos/orders_profile_repo/order_profile_repo_implementation.dart';

class GetOrderProfileCubit extends Cubit<GetOrderProfileState> {
  GetOrderProfileCubit() : super(const GetOrderProfileState());

  static GetOrderProfileCubit get(context) => BlocProvider.of(context);
  Map<int, bool> loadingStatus = <int, bool>{};
  Future<void> getOrders() async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      completedOrders: null,
      pendingOrders: null,
      isDeleted: false,
    ));

    final result = await OrderProfileRepoImplementation().getOrders();
    result.fold(
      (error) => emit(
          state.copyWith(isLoading: false, errorMessage: error.errorMessage)),
      (orders) {
        List<GetOrderModel> completed = <GetOrderModel>[];
        List<GetOrderModel> pending = <GetOrderModel>[];
        for (GetOrderModel order in orders) {
          loadingStatus[order.id] = false;
          if (order.status == 'complete') {
            completed.add(order);
          } else {
            pending.add(order);
          }
        }
        emit(state.copyWith(
          isLoading: false,
          completedOrders: completed,
          pendingOrders: pending,
          errorMessage: null,
          ordersLoadingStatus: loadingStatus,
        ));
      },
    );
  }

  Future<void> deleteOrder({required int orderId}) async {
    emit(
      state.copyWith(
          ordersLoadingStatus: {...state.ordersLoadingStatus, orderId: true},
          isDeleted: false),
    );
    final result =
        await OrderProfileRepoImplementation().deleteOrder(orderId: orderId);

    result.fold(
      (error) {
        emit(state.copyWith(
            errorMessage: error.errorMessage,
            isDeleted: false,
            ordersLoadingStatus: {
              ...state.ordersLoadingStatus,
              orderId: false
            }));
      },
      (value) {
        state.ordersLoadingStatus[orderId] = false;
        emit(
          state.copyWith(isDeleted: true, ordersLoadingStatus: {
            ...state.ordersLoadingStatus,
            orderId: false
          }),
        );
        getOrders();
      },
    );
  }
}
