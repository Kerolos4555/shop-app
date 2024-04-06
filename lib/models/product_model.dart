class ProductModel {
  final int id;
  final num price;
  final num oldPrice;
  final num discount;
  final String image;
  final String name;
  final bool inFavorites;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.inFavorites,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      inFavorites: json['in_favorites'],
    );
  }
}
