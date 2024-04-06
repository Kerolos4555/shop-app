import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/search_cubit/search_state.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/shared/constants.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;
  void searchproducts(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: 'products/search',
      data: {
        'text': text,
      },
      token: token,
    ).then(
      (value) {
        searchModel = SearchModel.fromJson(value.data);
        emit(SearchSuccessState());
      },
    ).catchError(
      (error) {
        debugPrint('There was an error ${error.toString()}');
        emit(SearchErrorState());
      },
    );
  }
}
