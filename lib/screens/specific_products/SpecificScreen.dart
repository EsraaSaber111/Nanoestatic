
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/all_products_model.dart';
import 'package:shop_app/service/Api.dart';

class SpecificScreen extends StatelessWidget {
  static String routeName = "/specific";
  String title;
  int c_id;
  SpecificScreen(this.c_id, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsBody(c_id, title),
      drawer: Drawer(
        child: drawer(),
      ),
    );
  }
}

class ProductsBody extends StatefulWidget {
  int c_id;
  String title;
  ProductsBody(this.c_id, this.title);

  @override
  _productsbodyState createState() => _productsbodyState();
}

class _productsbodyState extends State<ProductsBody> {

  AllProductsModel specific_products;
  String userid;
 // AllProductsModel ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Api.getAllProducts(widget.c_id).then((value) {
      setState(() {
        specific_products = value;
      });
    });
    SharedPreferences.getInstance().then((pref) {
      setState(() {
        userid = pref.getString('id');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///have to solve appBar
      appBar: AppBar(
        title: Row(
          children: [
            Text('${widget.title}'),

           // Text(' ${getTranslated(context, 'product')}')
          ],
        ),
      ),
      body: SafeArea(
          child: specific_products == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : AnimationLimiter(
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                      children:
                          List.generate(specific_products.allProducts.length, (index) {
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
                                        product: specific_products.allProducts[index], userid: userid,),
                                  ),
                                )));
                      }).toList()),
                )),
    );
  }
}
