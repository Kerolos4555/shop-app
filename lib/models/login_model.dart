import 'package:shop_app/models/user_data_model.dart';

class LoginModel {
  final bool status;
  final String? message;
  final UserDataModel? data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? UserDataModel.fromJson(json['data']) : null,
    );
  }
}
