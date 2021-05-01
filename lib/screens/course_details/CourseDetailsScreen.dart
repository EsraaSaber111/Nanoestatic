import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/custom_app_bar.dart';

import 'components/body.dart';
class CourseDetailsScreen extends StatelessWidget {
  static String routeName = "/coursedetails";
  @override
  Widget build(BuildContext context) {
    final CourseDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
    appBar: CustomAppBar(rating: agrs.product.rating),
    body: Body(product: agrs.product));
  }
}
class CourseDetailsArguments {
  final Product product;

  CourseDetailsArguments({@required this.product});
}
