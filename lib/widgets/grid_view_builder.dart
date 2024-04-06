import 'package:flutter/material.dart';
import 'package:shop_app/models/home_products_model.dart';
import 'package:shop_app/widgets/product_item.dart';

class GridViewBuilder extends StatelessWidget {
  final HomeProductModel homeProductModel;
  const GridViewBuilder({super.key, required this.homeProductModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1 / 1.6,
        children: List.generate(
          homeProductModel.data.productList.length,
          (index) => ProductItem(productModel: homeProductModel.data.productList[index]),
        ),
      ),
    );
  }
}
