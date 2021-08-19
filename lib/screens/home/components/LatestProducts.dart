import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/all_products_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/service/Api.dart';

class LatestProducts extends StatefulWidget {
  const LatestProducts({Key key}) : super(key: key);
  @override
  _LatestProductsState createState() => _LatestProductsState();
}
class _LatestProductsState extends State<LatestProducts> {
  Future<AllProductsModel>allproducts;
  String userid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allproducts=Api.getHomeProducts();
    SharedPreferences.getInstance().then((pref) {
      setState(() {
        userid = pref.getString('id');
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: "${getTranslated(context, 'Latest_Products')}", press: () {}),
        ),
        SizedBox(height:20),
        FutureBuilder<AllProductsModel>(
            future: allproducts,
            builder: (_,snapshot){
              if(snapshot.hasData){
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                       /// 2,
                       snapshot.data.allProducts.length,
                        //  snapshot.data.allProducts.length,
                            (index) {
                          // if (snapshot.data.allProducts[index].isOffer==1)
                          return ProductCard(product: snapshot.data.allProducts[index],userid: userid,);
                          return SizedBox
                              .shrink(); // here by default width and height is 0
                        },
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                );
                //return Center(child: Text('found'));
              }
              else if(snapshot.connectionState==ConnectionState.waiting){
                return Center();
              }else{
                return Center(child: Text('not found'));
              }
            }
        )
      ],
    );
  }
}