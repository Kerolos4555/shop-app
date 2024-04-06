import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/widgets/favorite_item.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final favoritesProduct = ShopCubit.get(context)
                .favoritesModel!
                .favoritesData
                ?.data?[index]
                .favoritesProduct;
            if (favoritesProduct != null) {
              return FavoriteItem(favoritesProduct: favoritesProduct);
            } else {
              return const Center(
                child: Text(
                  'No Favorites',
                ),
              ); 
            }
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
            );
          },
          itemCount: ShopCubit.get(context)
              .favoritesModel!
              .favoritesData!
              .data!
              .length,
        );
      },
    );
  }
}
