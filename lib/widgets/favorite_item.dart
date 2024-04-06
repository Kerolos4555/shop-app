import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/models/favorites_model.dart';

class FavoriteItem extends StatelessWidget {
  final FavoritesProduct favoritesProduct;
  const FavoriteItem({super.key, required this.favoritesProduct});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    width: 120,
                    height: 120,
                    image: NetworkImage(
                      favoritesProduct.image,
                    ),
                  ),
                  if (favoritesProduct.discount != 0)
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        favoritesProduct.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${favoritesProduct.price}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          if (favoritesProduct.discount != 0)
                            Text(
                              '\$${favoritesProduct.oldPrice}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          const Spacer(),
                          Builder(
                            builder: (context) => IconButton(
                              onPressed: () {
                                ShopCubit.get(context)
                                    .changeFavorites(favoritesProduct.id);
                              },
                              icon: CircleAvatar(
                              backgroundColor: ShopCubit.get(context)
                                      .favorites[favoritesProduct.id]!
                                  ? Colors.red
                                  : Colors.grey,
                              radius: 15,
                              child: const Icon(
                                Icons.favorite,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
