import 'package:equatable/equatable.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';

class GetOrderProfileState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<GetOrderModel> completedOrders;
  final List<GetOrderModel> pendingOrders;
  final bool isDeleted;
  final Map<int, bool> ordersLoadingStatus;
  const GetOrderProfileState({
    this.isDeleted = false,
    this.isLoading = false,
    this.errorMessage,
    this.completedOrders = const [],
    this.pendingOrders = const [],
    this.ordersLoadingStatus = const {},
  });

  GetOrderProfileState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GetOrderModel>? completedOrders,
    List<GetOrderModel>? pendingOrders,
    bool? isDeleted,
    Map<int, bool>? ordersLoadingStatus,
  }) {
    return GetOrderProfileState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      completedOrders: completedOrders ?? this.completedOrders,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      isDeleted: isDeleted ?? this.isDeleted,
      ordersLoadingStatus: ordersLoadingStatus ?? this.ordersLoadingStatus,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        completedOrders,
        pendingOrders,
        isDeleted,
        ordersLoadingStatus
      ];
}
