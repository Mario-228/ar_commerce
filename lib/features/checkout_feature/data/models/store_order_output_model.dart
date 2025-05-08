class StoreOrderOutputModel {
  final String message;
  final StoreOrderDetailsOutputModel order;

  StoreOrderOutputModel({
    required this.message,
    required this.order,
  });

  static StoreOrderOutputModel fromJson(Map<String, dynamic> json) =>
      StoreOrderOutputModel(
        message: json['message'],
        order: StoreOrderDetailsOutputModel.fromJson(json['order']),
      );
}

class StoreOrderDetailsOutputModel {
  final String name;
  final String email;
  final String address;
  final String phone;
  final int userId;
  final num total;
  final String status;
  final String? paymentMethod;
  final String? transactionId;
  final String? paidAt;
  final String? note;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  StoreOrderDetailsOutputModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.userId,
    required this.total,
    required this.status,
    required this.paymentMethod,
    required this.transactionId,
    required this.paidAt,
    required this.note,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  static StoreOrderDetailsOutputModel fromJson(Map<String, dynamic> json) =>
      StoreOrderDetailsOutputModel(
        name: json['name'],
        email: json['email'],
        address: json['address'],
        phone: json['phone'],
        userId: json['user_id'],
        total: json['total'],
        status: json['status'],
        paymentMethod: json['payment_method'],
        transactionId: json['transaction_id'],
        paidAt: json['paid_at'],
        note: json['note'],
        updatedAt: DateTime.parse(json['updated_at']),
        createdAt: DateTime.parse(json['created_at']),
        id: json['id'],
      );
}
