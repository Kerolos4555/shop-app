import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    width: double.infinity,
                    height: 200,
                    image: NetworkImage(
                      productModel.image,
                    ),
                  ),
                  if (productModel.discount != 0)
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${productModel.price}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (productModel.discount != 0)
                          Text(
                            '\$${productModel.oldPrice}',
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
                                  .changeFavorites(productModel.id);
                            },
                            icon: CircleAvatar(
                              backgroundColor: ShopCubit.get(context)
                                      .favorites[productModel.id]!
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
            ],
          ),
        );
      },
    );
  }
}
