import 'package:flutter/material.dart';

class Provider_control with ChangeNotifier {
  Color _themeData = Color(0xff424242);
  String local = 'ar';
  bool isLogin = false;
  int count = 0;
  Provider_control();

  getColor() => _themeData;
  getlocal() => local;
  getcount() => count;

  setColor(Color themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  setCount(int Data) async {
    count = Data;
    notifyListeners();
  }

  setLogin(bool isLog) {
    isLogin = isLog;
    notifyListeners();
  }

  setLocal(String st) {
    local = st;
    notifyListeners();
  }
}
