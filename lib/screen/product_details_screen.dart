
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/assets_manager.dart';
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> productsImage = [
    AssetsManager.productImage1,
    AssetsManager.productImage2
  ];
  int? currentIndex1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [],
        //leading: ,
        title: const Text("Product details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            FanCarouselImageSlider(
              showIndicator: false,
              imagesLink: productsImage,
              initalPageIndex: currentIndex1!,
              //   initalPageIndex: ,
              isAssets: true,
              autoPlay: false,
              sliderHeight: 400,
              sliderWidth: 400,
              isClickable: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              currentIndex1 == 0 ? Colors.green : Colors.grey,
                          width: 2.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      productsImage[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color:
                              currentIndex1 == 1 ? Colors.green : Colors.grey,
                          width: 2.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      productsImage[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Image.asset(productsImage[1],width: 50,height: 50,),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sea Strike Printed Satin Scarf',
                  style: TextStyle(color: Colors.white),
                ),
                CircleAvatar(radius: 20, child: Icon(Icons.code_rounded))
              ],
            ),
           const  SizedBox(height: 20,),
              const  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EGP 180',
                  style: TextStyle(color: Colors.white),
                ),
                Text('Fusedbruch',style: TextStyle(color: Colors.white),),
              ],
            ),
             const  SizedBox(height: 20,),
          const  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Size',
                  style: TextStyle(color: Colors.white),
                ),
                Text('Size Chart',style: TextStyle(color: Colors.white),),
              ],
            ),
           const  SizedBox(height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){}, child:const  Text("50X50",style: TextStyle(color: Colors.white),)),
              TextButton(onPressed: (){}, child:const  Text("50X50",style: TextStyle(color: Colors.white),)),
              TextButton(onPressed: (){}, child:const  Text("50X50",style: TextStyle(color: Colors.white),)),
              TextButton(onPressed: (){}, child:const  Text("50X50",style: TextStyle(color: Colors.white),)),
            ],
           )
          ]),
        ),
      ),
    );
  }
}
