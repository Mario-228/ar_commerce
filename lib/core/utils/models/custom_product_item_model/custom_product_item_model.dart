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
  bool isFavorite;
  bool isLike;
  final int productTypeId;
  final String productType;
  final String image3DUrl; // final void Function()? onTap;
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
    required this.isLike,
    required this.image3DUrl,
    // required this.onTap,
    // required this.onFavouritePressed
  });

  static CustomProductItemModel fromJson(Map<String, dynamic> json) =>
      CustomProductItemModel(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        description: json['description'] ?? "",
        pictureUrl: json['pictureUrl'] ?? "https://via.placeholder.com/150",
        price: json['price'] ?? "0.0",
        currency: 'L.E ',
        isFavorite: json['isFav'] ?? false,
        isLike: json['isLike'] ?? false,
        productBrandId: json['productBrandId'] ?? 0,
        productTypeId: json['productTypeId'] ?? 0,
        quantity: json['quantity'] ?? 0,
        productBrand: json['productBrand'] ?? "",
        productType: json['productType'] ?? "",
        image3DUrl: json['urlGlb'] ??
            "https://modelviewer.dev/shared-assets/models/Astronaut.glb",
        // onTap: () {},
        // onFavouritePressed: json['onFavouritePressed'],
      );
}
