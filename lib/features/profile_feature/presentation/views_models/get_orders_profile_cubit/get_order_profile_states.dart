import 'package:equatable/equatable.dart';
import 'package:graduation_project_new_version/features/profile_feature/data/models/get_orders_model.dart';

class GetOrderProfileState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<GetOrderModel> completedOrders;
  final List<GetOrderModel> pendingOrders;
  final bool isLoadingWhenDeleteOrder;
  final bool isDeleted;
  const GetOrderProfileState({
    this.isDeleted = false,
    this.isLoading = false,
    this.errorMessage,
    this.completedOrders = const [],
    this.pendingOrders = const [],
    this.isLoadingWhenDeleteOrder = false,
  });

  GetOrderProfileState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GetOrderModel>? completedOrders,
    List<GetOrderModel>? pendingOrders,
    bool? isLoadingWhenDeleteOrder,
    bool? isDeleted,
  }) {
    return GetOrderProfileState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      completedOrders: completedOrders ?? this.completedOrders,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      isLoadingWhenDeleteOrder:
          isLoadingWhenDeleteOrder ?? this.isLoadingWhenDeleteOrder,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        completedOrders,
        pendingOrders,
        isLoadingWhenDeleteOrder,
        isDeleted,
      ];
}
