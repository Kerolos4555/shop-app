import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_products_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/pages/categories_page.dart';
import 'package:shop_app/pages/favorites_page.dart';
import 'package:shop_app/pages/products_page.dart';
import 'package:shop_app/pages/settings_page.dart';
import 'package:shop_app/shared/constants.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> pages = const [
    ProductsPage(),
    CategoriesPage(),
    FavoritesPage(),
    SettingsPage(),
  ];
  void changeBotNavIndex(int index) {
    currentIndex = index;
    emit(ShopChangeBotNavState());
  }

  HomeProductModel? productModel;
  Map<int, bool> favorites = {};
  void getProducts() {
    emit(ShopProductLoadingState());

    DioHelper.getData(
      url: 'home',
      token: token,
    ).then(
      (value) {
        productModel = HomeProductModel.fromJson(value.data);
        for (var element in productModel!.data.productList) {
          favorites.addAll({element.id: element.inFavorites});
        }
        emit(ShopProductSuccessState(homeProductModel: productModel!));
      },
    ).catchError(
      (error) {
        debugPrint('There was an error ${error.toString()}');
        emit(ShopProductErrorState(error: error.toString()));
      },
    );
  }

  ChangeFavoriteModel? favoriteModel;
  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;

    emit(ShopChangeFavoritesLoadingState());

    DioHelper.postData(
      url: 'favorites',
      data: {
        'product_id': productId,
      },
      token: token,
    ).then(
      (value) {
        favoriteModel = ChangeFavoriteModel.fromJson(value.data);
        if (!favoriteModel!.status) {
          favorites[productId] = !favorites[productId]!;
        } else {
          getFavorites();
        }
        emit(ShopChangeFavoritesSuccessState(
            changeFavoriteModel: favoriteModel!));
      },
    ).catchError(
      (error) {
        favorites[productId] = !favorites[productId]!;
        debugPrint('There was an error ${error.toString()}');
        emit(ShopChangeFavoritesErrorState(error: error));
      },
    );
  }

  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(ShopGetFavoritesLoadingState());

    DioHelper.getData(
      url: 'favorites',
      token: token,
    ).then(
      (value) {
        favoritesModel = FavoritesModel.fromJson(value.data);
        emit(ShopGetFavoritesSuccessState(favoritesModel: favoritesModel!));
      },
    ).catchError(
      (error) {
        debugPrint('There was an error ${error.toString()}');
        emit(ShopGetFavoritesErrorState(error: error));
      },
    );
  }

  CategoryModel? categoryModel;
  void getCategory() {
    emit(ShopGetCategoryLoadingState());

    DioHelper.getData(
      url: 'categories',
    ).then(
      (value) {
        categoryModel = CategoryModel.fromJson(value.data);
        emit(ShopGetCategorySuccessState(categoryModel: categoryModel!));
      },
    ).catchError(
      (error) {
        debugPrint('There was an error ${error.toString()}');
        emit(ShopGetCategoryErrorState(error: error));
      },
    );
  }

  LoginModel? userModel;
  void getUserProfile() {
    emit(ShopGetProfileLoadingState());

    DioHelper.getData(
      url: 'profile',
      token: token,
    ).then(
      (value) {
        userModel = LoginModel.fromJson(value.data);
        emit(ShopGetProfileSuccessState(userModel: userModel!));
      },
    ).catchError(
      (error) {
        debugPrint('There was an error ${error.toString()}');
        emit(ShopGetProfileErrorState(error: error));
      },
    );
  }

  void updateUserProfile({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopUpdateProfileLoadingState());

    DioHelper.putData(
      url: 'update-profile',
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
      token: token,
    ).then(
      (value) {
        userModel = LoginModel.fromJson(value.data);
        emit(ShopUpdateProfileSuccessState(userModel: userModel!));
      },
    ).catchError(
      (error) {
        debugPrint('There was an error ${error.toString()}');
        emit(ShopUpdateProfileErrorState(error: error));
      },
    );
  }
}
