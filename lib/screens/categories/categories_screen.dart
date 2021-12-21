import 'package:flutter/material.dart';
import 'package:nanoestatic/models/Product.dart';
import 'package:nanoestatic/screens/categories/compnents/body.dart';
class CategoriesScreen extends StatelessWidget {
  static String routeName = "/categories";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(),
    );
  }
}
