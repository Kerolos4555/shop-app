import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/models/search_model.dart';

class SearchProductsList extends StatelessWidget {
  final Product searchProduct;
  const SearchProductsList({super.key, required this.searchProduct});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: 120,
                height: 120,
                image: NetworkImage(
                  searchProduct.image,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        searchProduct.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${searchProduct.price.round()}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ShopCubit.get(context)
                                  .changeFavorites(searchProduct.id);
                            },
                            icon: CircleAvatar(
                              backgroundColor: ShopCubit.get(context)
                                      .favorites[searchProduct.id]!
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
