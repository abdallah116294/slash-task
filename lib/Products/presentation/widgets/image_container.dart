import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({
    super.key,
    required this.currentIndex1,
    required this.image,
  });

  final int? currentIndex1;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: currentIndex1 == 0 ? Colors.green : Colors.grey,
              width: 2.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}