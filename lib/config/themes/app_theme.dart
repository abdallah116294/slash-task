import 'package:flutter/material.dart';

ThemeData apptheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        
        backgroundColor: Colors.grey
      )
    ),
    appBarTheme:const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18
      )
    )
  );
}
