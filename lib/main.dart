import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/cubits/bloc_observer.dart';
import 'package:shop_app/helper/cached_helper.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/layouts/home_layout.dart';
import 'package:shop_app/pages/on_boarding_page.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await CachedHelper.init();

  DioHelper.init();

  bool? onBoarding = CachedHelper.getData(key: 'OnBoarding');

  token = CachedHelper.getData(key: 'token');

  Widget widget;

  if (onBoarding != null) {
    if (token != null) {
      widget = const HomeLayout();
    } else {
      widget = const LoginPage();
    }
  } else {
    widget = const OnBoardingPage();
  }

  runApp(MyApp(
    startupWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startupWidget;
  const MyApp({super.key, required this.startupWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getProducts()..getCategory()..getFavorites()..getUserProfile(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startupWidget,
      ),
    );
  }
}
