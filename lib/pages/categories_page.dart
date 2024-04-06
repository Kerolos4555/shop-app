import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return CategoryItem(
                categoryData: ShopCubit.get(context)
                    .categoryModel!
                    .data
                    .categoryData[index]);
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
          itemCount:
              ShopCubit.get(context).categoryModel!.data.categoryData.length,
        );
      },
    );
  }
}
