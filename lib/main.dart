import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/Products/presentation/cubit/get_products_cubit.dart';
import 'package:slash_task/Products/presentation/screen/products_screen.dart';
import 'package:slash_task/config/themes/app_theme.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>di.sl<GetProductsCubit>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: apptheme(),
          home: const ProductsScreen(),
        ));
  }
}
