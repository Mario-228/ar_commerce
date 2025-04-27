class CartModel {
  final List<CartItem> cart;
  final double totalCart;

  CartModel({
    required this.cart,
    required this.totalCart,
  });

  static CartModel fromJson(Map<String, dynamic> json) {
    return CartModel(
      cart: (json['cart'] as List<dynamic>?)
              ?.map((item) => CartItem.fromJson(item))
              .toList() ??
          [],
      totalCart: (json['total cart'] != null)
          ? double.tryParse(json['total cart'].toString()) ?? 0.0
          : 0.0,
    );
  }
}

class CartItem {
  final int id;
  final int userId;
  final int productId;
  final int quantity;
  final DateTime createdAt;
  final DateTime updatedAt;
  final num total;
  final ProductModel product;

  CartItem({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.total,
    required this.product,
  });

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      total: double.tryParse(json['total'].toString()) ?? 0.0,
      product: ProductModel.fromJson(json['product'] ?? {}),
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String pictureUrl;
  final String urlGlb;
  final double price;
  final int productBrandId;
  final int productTypeId;
  final int quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureUrl,
    required this.urlGlb,
    required this.price,
    required this.productBrandId,
    required this.productTypeId,
    required this.quantity,
  });

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['Id'] ?? 0,
      name: json['Name'] ?? '',
      description: json['Description'] ?? '',
      pictureUrl: json['PictureUrl'] ?? '',
      urlGlb: json['UrlGlb'] ?? '',
      price: double.tryParse(json['Price'].toString()) ?? 0.0,
      productBrandId: json['ProductBrandId'] ?? 0,
      productTypeId: json['ProductTypeId'] ?? 0,
      quantity: json['Quantity'] ?? 0,
    );
  }
}
