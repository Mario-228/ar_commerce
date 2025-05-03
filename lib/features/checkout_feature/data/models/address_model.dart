class AddressModel {
  int? id;
  int? userId;
  String address;
  String receiverName;
  String receiverEmail;
  String phone;
  String? createdAt;
  String? updatedAt;

  AddressModel({
    this.id,
    this.userId,
    required this.address,
    required this.receiverName,
    required this.receiverEmail,
    required this.phone,
    this.createdAt,
    this.updatedAt,
  });

  static AddressModel fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'],
        userId: json['user_id'],
        address: json['address'],
        receiverName: json['receiver_name'],
        receiverEmail: json['receiver_email'],
        phone: json['phone'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (userId != null) 'user_id': userId,
        'address': address,
        'receiver_name': receiverName,
        'receiver_email': receiverEmail,
        'phone': phone,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };
}
