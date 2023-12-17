import 'package:carousel_grid/carousel_grid.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/Products/presentation/widgets/cart_icon_button.dart';
import 'package:slash_task/Products/presentation/widgets/image_container.dart';
import 'package:slash_task/core/utils/assets_manager.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen(
      {super.key,
      required this.images,
      required this.productName,
      required this.productPrice,
      required this.productBrand});
  List<String> images; 
  String productName;
  int productPrice;
  String productBrand;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> productsImage = [
    AssetsManager.productImage1,
    AssetsManager.productImage2
  ];
  List<Color> buttonColor = List.filled(5,Colors.grey );
  void changeColor(int index) {
    setState(() {
      buttonColor [index]=
          buttonColor [index]== Colors.grey ? Colors.lightGreen : Colors.grey;
    });
  }

  int? currentIndex1 = 0;
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
       final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            FanCarouselImageSlider(
              showIndicator: false,
              autoPlay: false,
              imagesLink: widget.images,
              initalPageIndex: currentIndex1!,
              isAssets: false,   
              sliderHeight: 300,
              sliderWidth: 300,
            ),
            //test new package 
          //  CarouselGrid(width: 400,height: 285, iconBack: const Icon(Icons.arrow_back,color: Colors.white,),listUrlImages: widget.images),
            //it is work but last one is better 
            Container(
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  controller: controller,
                  itemBuilder: (context, index) {
                    return ImageContainer(
                        currentIndex1: currentIndex1,
                        image: widget.images[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 7,
                      ),
                  itemCount: widget.images.length),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.productName,
                  style: const TextStyle(color: Colors.white),
                ),
                const CircleAvatar(radius: 20, child: Icon(Icons.code_rounded))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${widget.productPrice.toString()}",
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  widget.productBrand,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Size',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Size Chart',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor[index])
                      ),
                        onPressed: () {
                          //change Color
                          changeColor(index);
                        },
                        child: const Text(
                          "50X50",
                          style: TextStyle(color: Colors.white),
                        ));
                  },
                  separatorBuilder: (context, index) =>const Divider(
                        endIndent: 16,
                      ),
                  itemCount: 5),
            ),
            const SizedBox(height: 20,),
             FittedBox(
                fit: BoxFit.cover,
                child: ECCartAddButton(
                  width: deviceW / 2,
                  height: deviceH / 12,
                  fontSize: 20,
                  color: '',
                ),
              ),
          ]),
        ),
      ),
    );
  }
}


