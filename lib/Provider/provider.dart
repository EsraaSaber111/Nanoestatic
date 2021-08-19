import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/all_categories_model.dart';
import 'package:http/http.dart' as http ;
import 'package:shop_app/service/Api.dart';
import '../api_constants.dart';

class Provider_control with ChangeNotifier {
  Color _themeData = Color(0xff424242);
  String local = 'ar';
  bool isLogin = false;
  int count = 0;

  AllCategoriesModel allCategoriesModel=AllCategoriesModel();

  Provider_control();

  getPostData(context) async {
    allCategoriesModel = await Api.getAllCategories();
    notifyListeners();
  }


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
