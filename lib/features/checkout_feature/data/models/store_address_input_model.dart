class StoreAddressInputModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? note;
  StoreAddressInputModel(
      {this.name, this.email, this.phone, this.address, this.note});
  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (address != null) 'address': address,
        if (note != null) 'note': note
      };
}
