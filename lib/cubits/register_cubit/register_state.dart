import 'package:shop_app/models/login_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final LoginModel loginModel;
  RegisterSuccessState({required this.loginModel});
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState({required this.error});
}

class RegisterPasswordVisibilityState extends RegisterStates {}
