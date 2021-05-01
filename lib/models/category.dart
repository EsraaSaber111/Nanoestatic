import 'package:shop_app/models/Product.dart';
import 'package:flutter/material.dart';

class CategoryModel{
  final List<Product> product;
  final String name,img;

  CategoryModel({@required this.product, @required this.name,@required this.img});
}

// Demo data for our cart

List<CategoryModel> demoCategory = [
  CategoryModel(product: men, name:'Men',img:'assets/images/bodyitem.jpg'),
  CategoryModel(product: women, name: 'Women',img:'assets/images/bodyitem.jpg'),
  CategoryModel(product: kids, name: 'Kids',img:'assets/images/bodyitem.jpg'),
  CategoryModel(product: body, name: 'Body',img:'assets/images/bodyitem.jpg'),
];
