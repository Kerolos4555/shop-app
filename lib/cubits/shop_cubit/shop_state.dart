import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_products_model.dart';
import 'package:shop_app/models/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBotNavState extends ShopStates {}

class ShopProductLoadingState extends ShopStates {}

class ShopProductSuccessState extends ShopStates {
  final HomeProductModel homeProductModel;
  ShopProductSuccessState({required this.homeProductModel});
}

class ShopProductErrorState extends ShopStates {
  final String error;
  ShopProductErrorState({required this.error});
}

class ShopChangeFavoritesLoadingState extends ShopStates {}

class ShopChangeFavoritesSuccessState extends ShopStates {
  final ChangeFavoriteModel changeFavoriteModel;
  ShopChangeFavoritesSuccessState({required this.changeFavoriteModel});
}

class ShopChangeFavoritesErrorState extends ShopStates {
  final String error;
  ShopChangeFavoritesErrorState({required this.error});
}

class ShopGetFavoritesLoadingState extends ShopStates {}

class ShopGetFavoritesSuccessState extends ShopStates {
  final FavoritesModel favoritesModel;
  ShopGetFavoritesSuccessState({required this.favoritesModel});
}

class ShopGetFavoritesErrorState extends ShopStates {
  final String error;
  ShopGetFavoritesErrorState({required this.error});
}

class ShopGetCategoryLoadingState extends ShopStates {}

class ShopGetCategorySuccessState extends ShopStates {
  final CategoryModel categoryModel;
  ShopGetCategorySuccessState({required this.categoryModel});
}

class ShopGetCategoryErrorState extends ShopStates {
  final String error;
  ShopGetCategoryErrorState({required this.error});
}

class ShopGetProfileLoadingState extends ShopStates {}

class ShopGetProfileSuccessState extends ShopStates {
  final LoginModel userModel;
  ShopGetProfileSuccessState({required this.userModel});
}

class ShopGetProfileErrorState extends ShopStates {
  final String error;
  ShopGetProfileErrorState({required this.error});
}

class ShopUpdateProfileLoadingState extends ShopStates {}

class ShopUpdateProfileSuccessState extends ShopStates {
  final LoginModel userModel;
  ShopUpdateProfileSuccessState({required this.userModel});
}

class ShopUpdateProfileErrorState extends ShopStates {
  final String error;
  ShopUpdateProfileErrorState({required this.error});
}
