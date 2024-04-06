import 'package:shop_app/models/boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final BoardingModel boardingModel;
  const OnBoardingItem({super.key, required this.boardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(boardingModel.image),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          boardingModel.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          boardingModel.body,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
