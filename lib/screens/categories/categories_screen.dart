import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/categories/compnents/body.dart';
class CategoriesScreen extends StatelessWidget {
  static String routeName = "/categories";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(),
    );
  }
}
