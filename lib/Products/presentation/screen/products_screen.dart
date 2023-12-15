import 'package:flutter/material.dart';
import 'package:slash_task/Products/presentation/widgets/cart_icon_button.dart';
import 'package:slash_task/core/utils/assets_manager.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Products Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 50 / 9,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.4)),
          itemBuilder: (context, index) {
            return ProductItemCart(deviceH: deviceH, deviceW: deviceW);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

class ProductItemCart extends StatelessWidget {
  const ProductItemCart({
    super.key,
    required this.deviceH,
    required this.deviceW,
  });

  final double deviceH;
  final double deviceW;

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
            tag: AssetsManager.productImage1,
            child: Container(
              height: deviceH / 5.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(AssetsManager.productImage1),
              )),
            )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 13, vertical: deviceH / 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Hero(
                tag: AssetsManager.productImage1,
                child: Material(
                  child: Text(
                    "Product Example",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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
              const Text(
                "\$200",
                style: TextStyle(
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
