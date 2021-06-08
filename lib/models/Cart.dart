import 'package:flutter/material.dart';


class ProductCart {
   int id,product_id, numOfItem;
  ProductCart({@required this.product_id, @required this.numOfItem});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.product_id;
    data['quantity'] = this.numOfItem;
    return data;
  }
  String to_String() {
    final String data = '';
    return '{"product_id":${product_id.toString()},"quantity":${numOfItem.toString()}}';
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this.id;
    map["product_id"] = this.product_id;
    map["quantity"] = this.numOfItem;
    return map;
  }

  ProductCart.getMap(Map<String, dynamic> map){
    this.id = map["id"];
    this.product_id = map["product_id"];
    this.numOfItem = map["quantity"];


  }
}

// Demo data for our cart

List<ProductCart> demoCarts = [
  // ProductCart(id: 2, numOfItem: 2),
  // ProductCart(id: 3, numOfItem: 5),
  // Cart(product: demoProducts[0], numOfItem: 2),
  // Cart(product: demoProducts[1], numOfItem: 1),
  // Cart(product: demoProducts[3], numOfItem: 1),
];

