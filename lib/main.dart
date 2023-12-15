import 'package:flutter/material.dart';
import 'package:slash_task/Products/presentation/screen/products_screen.dart';
import 'package:slash_task/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: apptheme(),
      home:const ProductsScreen() ,
    );
  }
}

