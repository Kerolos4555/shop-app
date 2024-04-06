import 'package:shop_app/models/home_data_model.dart';

class HomeProductModel {
  final bool status;
  final HomeDataModel data;

  HomeProductModel({
    required this.status,
    required this.data,
  });

  factory HomeProductModel.fromJson(json) {
    return HomeProductModel(
      status: json['status'],
      data: HomeDataModel.fromJson(json['data']),
    );
  }
}
