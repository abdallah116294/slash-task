import 'package:flutter/material.dart';
import 'package:slash_task/Products/presentation/widgets/cart_icon_button.dart';
import 'package:slash_task/core/utils/assets_manager.dart';

class ProductItemCart extends StatelessWidget {
  const ProductItemCart({
    super.key,
    required this.deviceH,
    required this.deviceW,
    required this.thumbnail,
    required this.title,
    required this.price,
  });

  final double deviceH;
  final double deviceW;
  final String thumbnail;
  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Column(children: [
        Hero(
            transitionOnUserGestures: true,
            tag: thumbnail,
            child: Container(
              height: deviceH / 5.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(thumbnail),
              )),
            )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: deviceH / 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: thumbnail,
                child: Material(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ), //wrapped the text in a material widget to prevent text zstyle glitches during transition.
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "\$${price}",
                style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14),
              ),
              SizedBox(height: deviceH / 170),
              const Spacer(),
              FittedBox(
                fit: BoxFit.cover,
                child: ECCartAddButton(
                  width: deviceW / 2,
                  height: deviceH / 12,
                  fontSize: 20,
                  color: '',
                ),
              ),
              const Spacer()
            ],
          ),
        ))
      ]),
    );
  }
}
