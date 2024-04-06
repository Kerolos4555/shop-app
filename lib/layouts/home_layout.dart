import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/pages/search_page.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Shop',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchPage();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          body: ShopCubit.get(context)
              .pages[ShopCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(
              size: 28,
            ),
            unselectedIconTheme: const IconThemeData(
              size: 26,
            ),
            selectedFontSize: 16,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            onTap: (index) {
              ShopCubit.get(context).changeBotNavIndex(index);
            },
            currentIndex: ShopCubit.get(context).currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_max_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
