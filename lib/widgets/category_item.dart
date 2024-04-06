import 'package:flutter/material.dart';
import 'package:shop_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryData;
  const CategoryItem({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: Row(
        children: [
          Image(
            width: 90,
            height: 90,
            fit: BoxFit.cover,
            image: NetworkImage(
              categoryData.image,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            categoryData.name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward,
          ),
        ],
      ),
    );
  }
}
