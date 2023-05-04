import 'package:flutter/material.dart';

class LightThemMode {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffE5E5E5),
      appBarTheme:
          const AppBarTheme(
            backgroundColor: Colors.transparent, 
            titleTextStyle: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0));
}
