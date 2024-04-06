import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/shared/show_snack_bar.dart';
import 'package:shop_app/widgets/carousel_slider_builder.dart';
import 'package:shop_app/widgets/grid_view_builder.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopChangeFavoritesSuccessState) {
          if (!state.changeFavoriteModel.status) {
            showSnackBar(
              context,
              state.changeFavoriteModel.message,
            );
          }
        }
      },
      builder: (context, state) {
        return ShopCubit.get(context).productModel != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSliderBuilder(
                      homeProductModel: ShopCubit.get(context).productModel!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'New Products',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GridViewBuilder(
                      homeProductModel: ShopCubit.get(context).productModel!,
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
      },
    );
  }
}
