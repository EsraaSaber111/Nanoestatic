import 'package:flutter/material.dart';


class ProductCart {

  final int id, numOfItem;
  ProductCart({@required this.id, @required this.numOfItem});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.id;
    data['quantity'] = this.numOfItem;
    return data;
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
