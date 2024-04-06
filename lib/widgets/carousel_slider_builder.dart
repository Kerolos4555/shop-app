import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/home_products_model.dart';

class CarouselSliderBuilder extends StatelessWidget {
  final HomeProductModel homeProductModel;
  const CarouselSliderBuilder({super.key, required this.homeProductModel});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: homeProductModel.data.bannersList
          .map(
            (e) => Image(
              fit: BoxFit.cover,
              width: double.infinity,
              image: NetworkImage(
                e.image,
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1,
        enlargeCenterPage: false,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
