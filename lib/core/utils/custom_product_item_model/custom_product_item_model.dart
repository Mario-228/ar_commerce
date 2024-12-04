class CustomProductItemModel {
  final int id;
  final String name;
  final String description;
  final String pictureUrl;
  final num price;
  final int quantity;
  final int productBrandId;
  final String currency;
  final String productBrand;
  final bool isFavorite;
  final int productTypeId;
  final String productType;
  // final void Function()? onTap;
  // final void Function()? onFavouritePressed;

  CustomProductItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.productTypeId,
    required this.quantity,
    required this.productType,
    required this.productBrand,
    required this.productBrandId,
    required this.pictureUrl,
    required this.isFavorite,
    // required this.onTap,
    // required this.onFavouritePressed
  });

  static CustomProductItemModel fromJson(Map<String, dynamic> json) =>
      CustomProductItemModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureUrl: json['pictureUrl'],
        price: json['price'],
        currency: 'L.E ',
        isFavorite: false,
        productBrand: json['productBrand'],
        productBrandId: json['productBrandId'],
        quantity: json['quantity'],
        productTypeId: json['productTypeId'],
        productType: json['productType'],
        // onTap: () {},
        // onFavouritePressed: json['onFavouritePressed'],
      );
}
