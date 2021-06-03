import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/screens/specific_products/components/Products_Category_Card.dart';
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
  Future<AllProductsModel> products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = Api.getAllProducts(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///have to solve appBar
      appBar: AppBar(
        title: Text('${widget.title} Products'),
      ),
      body: SafeArea(
          child: FutureBuilder<AllProductsModel>(
        future: products,
        builder: (_, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasData) {
            return AnimationLimiter(
              child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                  children:
                      List.generate(snapshot.data.allProducts.length, (index) {

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
                                child: ProductCategoryCard(
                                    snapshot.data.allProducts[index]),
                              ),
                            )));
                  }).toList()),
            );
          } else {
            return Center(
              child: Text('error'),
            );
          }
        },
      )),
    );
  }
}
