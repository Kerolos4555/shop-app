import 'package:shop_app/cubits/register_cubit/register_state.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
  IconData suffix = Icons.visibility_off_outlined;
  void changePasswordSuffixIcon() {
    isVisible = !isVisible;
    suffix =
        isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterPasswordVisibilityState());
  }

  late LoginModel model;
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: 'register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then(
      (value) {
        model = LoginModel.fromJson(value.data);
        emit(RegisterSuccessState(
          loginModel: model,
        ));
      },
    ).catchError(
      (error) {
        emit(RegisterErrorState(
          error: error.toString(),
        ));
      },
    );
  }
}
