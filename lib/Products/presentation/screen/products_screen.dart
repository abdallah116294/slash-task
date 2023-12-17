import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/Products/presentation/cubit/get_products_cubit.dart';
import 'package:slash_task/Products/presentation/screen/product_details_screen.dart';
import 'package:slash_task/Products/presentation/widgets/product_cart_widget.dart';
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
      body: BlocProvider(
        create: (context) => di.sl<GetProductsCubit>()..getProducts(),
        child: BlocBuilder<GetProductsCubit, GetProductsState>(
            builder: (context, state) {
          if (state is GetProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (state is GetProducstLoadedState) {
            return GridView.builder(
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  mainAxisSpacing: 50 /2 ,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.2)),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>ProductDetailsScreen(images:state.productsDataEntity.produts![index].images!.toList() , productName: state.productsDataEntity.produts![index].title.toString(), productPrice: state.productsDataEntity.produts![index].price!.toInt(), productBrand: state.productsDataEntity.produts![index].brand.toString(),)));
                    },
                    child: ProductItemCart(
                      deviceH: deviceH,
                      deviceW: deviceW,
                      thumbnail: state
                          .productsDataEntity.produts![index].thumbnail
                          .toString(),
                      title: state.productsDataEntity.produts![index].title
                          .toString(),
                      price: state.productsDataEntity.produts![index].price!
                          .toInt(),
                    ));
              },
              itemCount: state.productsDataEntity.produts!.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}

