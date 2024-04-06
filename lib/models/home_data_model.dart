import 'package:shop_app/models/banner_model.dart';
import 'package:shop_app/models/product_model.dart';

class HomeDataModel {
  final List<BannerModel> bannersList = [];
  final List<ProductModel> productList = [];

  HomeDataModel.fromJson(json) {
    json['banners'].forEach(
      (element) {
        bannersList.add(
          BannerModel.fromJson(element)
        );
      },
    );
    json['products'].forEach(
      (element) {
        productList.add(
          ProductModel.fromJson(element)
        );
      },
    );
  }
}
