class EditAddressUserModel {
  String? address;
  String? receiverName;
  String? receiverEmail;
  String? phone;

  EditAddressUserModel({
    this.address,
    this.receiverName,
    this.receiverEmail,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        if (address != null) 'address': address,
        if (receiverName != null) 'receiver_name': receiverName,
        if (receiverEmail != null) 'receiver_email': receiverEmail,
        if (phone != null) 'phone': phone,
      };
}
