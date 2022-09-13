import 'package:flutter/material.dart' show ChangeNotifier;

class HomeNavBackProvider with ChangeNotifier {
  bool _hasBack = false;

  HomeNavBackProvider() : super();

  bool get hasBack => _hasBack;

  void setBack(bool back) {
    _hasBack = back;
    notifyListeners();
  }
}
