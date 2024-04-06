class CategoryModel {
  final bool status;
  final Data data;

  CategoryModel({
    required this.status,
    required this.data,
  });

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<CategoryData> categoryData = [];

  Data.fromJson(json) {
    json['data'].forEach((element) {
      categoryData.add(CategoryData.fromJson(element));
    });
  }
}

class CategoryData {
  final int id;
  final String name;
  final String image;

  CategoryData({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryData.fromJson(json) {
    return CategoryData(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
