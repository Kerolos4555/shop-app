class FavoritesModel {
  final bool status;
  final FavoritesData? favoritesData;

  FavoritesModel({
    required this.status,
    required this.favoritesData,
  });

  factory FavoritesModel.fromJson(json) {
    return FavoritesModel(
      status: json['status'],
      favoritesData:
          FavoritesData.fromJson(json['data']),
    );
  }
}

class FavoritesData {
  List<Data>? data;

  FavoritesData({required this.data});

  FavoritesData.fromJson(json) {
  data = [];
  if (json['data'] != null) {
    json['data'].forEach((element) {
      data!.add(Data.fromJson(element));
    });
  }
}
}

class Data {
  final int id;
  final FavoritesProduct? favoritesProduct;

  Data({
    required this.id,
    required this.favoritesProduct,
  });

  factory Data.fromJson(json) {
    return Data(
      id: json['id'],
      favoritesProduct: json['product'] != null
          ? FavoritesProduct.fromJson(json['product'])
          : null,
    );
  }
}

class FavoritesProduct {
  final int id;
  final num price;
  final num oldPrice;
  final num discount;
  final String image;
  final String name;
  final String description;

  FavoritesProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory FavoritesProduct.fromJson(json) {
    return FavoritesProduct(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
