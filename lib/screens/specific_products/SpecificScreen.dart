import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/components/product_card.dart';

import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/models/all_products_model.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/service/Api.dart';

class SpecificScreen extends StatelessWidget {
  static String routeName = "/specific";
  String title;
  int id;
  SpecificScreen(this.id,this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsBody(id,title),
      drawer: Drawer(
        child: drawer(),
      ),
    );
  }
}

class ProductsBody extends StatefulWidget {
  int id;
  String title;
  ProductsBody(this.id,this.title);


  @override
  _productsbodyState createState() => _productsbodyState();
}

class _productsbodyState extends State<ProductsBody> {
  AllProductsModel products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 Api.getAllProducts(widget.id).then((value) {
      setState(() {
        products=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///have to solve appBar
      appBar: AppBar(
        title: Text('${widget.title} Products'),
      ),
      body: SafeArea(
      child:products==null?Center(child: CircularProgressIndicator(),):AnimationLimiter(
      child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 10,
      childAspectRatio: 0.7,
      children:
      List.generate(products.allProducts.length, (index) {

        //      widget.title=snapshot.data.allProducts[index].data.title;

        return Padding(
        padding: const EdgeInsets.all(5.0),
    child: AnimationConfiguration.staggeredGrid(
    columnCount: 2,
    position: index,
    duration: const Duration(milliseconds: 375),
    child: ScaleAnimation(
    scale: 0.5,
    child: FadeInAnimation(

    child: ProductCard(
      product:products.allProducts[index]),
    ),
    )));
    }).toList()),
    )
      ),
    );
  }
}
