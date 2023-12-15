import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/Products/presentation/cubit/get_products_cubit.dart';
import 'package:slash_task/Products/presentation/widgets/cart_icon_button.dart';
import 'package:slash_task/core/utils/assets_manager.dart';
import 'package:slash_task/injection_container.dart' as di;

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
        title: const Text("Products Screen"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (context) => di.sl<GetProductsCubit>()..getProducts(),
            child: BlocBuilder<GetProductsCubit, GetProductsState>(
                builder: (context, state) {
              if (state is GetProductsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetProducstLoadedState) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50 / 9,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.4)),
                  itemBuilder: (context, index) {
                    return ProductItemCart(deviceH: deviceH, deviceW: deviceW, thumbnail: state.productsDataEntity.produts![index].thumbnail.toString(), title: state.productsDataEntity.produts![index].title.toString(), price: state.productsDataEntity.produts![index].price!.toInt(),);
                  },
                  itemCount: state.productsDataEntity.produts!.length,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          )),
    );
  }
}

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
                image: AssetImage(thumbnail),
              )),
            )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: deviceH / 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: AssetsManager.productImage1,
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
