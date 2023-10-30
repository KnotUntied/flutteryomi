import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _bottomNavVisibility = true;

  bool get bottomNavVisibility => _bottomNavVisibility;

  set bottomNavVisibility(bool visibility) {
    _bottomNavVisibility = visibility;
    notifyListeners();
  }
}
