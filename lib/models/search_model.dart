class SearchModel {
  final bool status;
  final SearchData? searchData;

  SearchModel({
    required this.status,
    required this.searchData,
  });

  factory SearchModel.fromJson(json) {
    return SearchModel(
      status: json['status'],
      searchData:
          json['data'] != null ? SearchData.fromjson(json['data']) : null,
    );
  }
}

class SearchData {
  final List<Product> product = [];

  SearchData.fromjson(json) {
    json['data'].forEach((element) {
      product.add(Product.fromJson(element));
    });
  }
}

class Product {
  final int id;
  final num price;
  final String image;
  final String name;
  final bool inFavorites;

  Product({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.inFavorites,
  });

  factory Product.fromJson(json) {
    return Product(
      id: json['id'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      inFavorites: json['in_favorites'],
    );
  }
}
