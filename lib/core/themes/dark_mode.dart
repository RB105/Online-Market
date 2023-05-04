import 'package:flutter/material.dart';

class DarkThemMode {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
      appBarTheme:
          const AppBarTheme(
            backgroundColor: Colors.blueGrey, 
            titleTextStyle: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0.0));
}
