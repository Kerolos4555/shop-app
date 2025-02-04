import 'package:shop_app/cubits/login_cubit/login_state.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
  IconData suffix = Icons.visibility_off_outlined;
  void changePasswordSuffixIcon() {
    isVisible = !isVisible;
    suffix =
        isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginPasswordVisibilityState());
  }

  late LoginModel model;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: 'login',
      data: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        model = LoginModel.fromJson(value.data);
        emit(LoginSuccessState(
          loginModel: model,
        ));
      },
    ).catchError(
      (error) {
        emit(LoginErrorState(
          error: error.toString(),
        ));
      },
    );
  }
}
