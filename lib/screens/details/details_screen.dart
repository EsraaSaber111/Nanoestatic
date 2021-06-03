import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  int id;
  DetailsScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      //appBar: CustomAppBar(rating: agrs.product.rating),
      body: Body(id),
    );
  }
}


