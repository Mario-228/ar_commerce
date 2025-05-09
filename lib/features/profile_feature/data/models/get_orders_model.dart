class GetOrderModel {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final double total;
  final String status;
  final String? paymentMethod;
  final String? transactionId;
  final String? paidAt;
  final String? note;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? deliveryId;
  final List<OrderDetail> orderDetail;

  GetOrderModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.total,
    required this.status,
    required this.paymentMethod,
    required this.transactionId,
    required this.paidAt,
    required this.note,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deliveryId,
    required this.orderDetail,
  });

  factory GetOrderModel.fromJson(Map<String, dynamic> json) {
    return GetOrderModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      total: double.parse(json['total']),
      status: json['status'],
      paymentMethod: json['payment_method'],
      transactionId: json['transaction_id'],
      paidAt: json['paid_at'],
      note: json['note'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deliveryId: json['deliveryId'],
      orderDetail: (json['order_detail'] as List)
          .map((item) => OrderDetail.fromJson(item))
          .toList(),
    );
  }
}

class OrderDetail {
  final int id;
  final int productId;
  final int orderId;
  final int quantity;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderDetail({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      productId: json['product_id'],
      orderId: json['order_id'],
      quantity: json['quantity'],
      price: double.parse(json['price']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
