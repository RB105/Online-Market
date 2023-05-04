import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;
  void changeLang() {
    if (currentIndex == 2) {
      currentIndex = 0;
      notifyListeners();
    } else {
      currentIndex++;
      notifyListeners();
    }
  }

  List<String> langs = ["en", "ru", "uz"];
}
