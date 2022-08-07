import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/components/product_card.dart';
import 'package:nanoestatic/localization/language_constants.dart';
import 'package:nanoestatic/models/all_products_model.dart';
import 'package:nanoestatic/models/product_model.dart';
import 'package:nanoestatic/screens/home/components/section_title.dart';
import 'package:nanoestatic/service/Api.dart';

class LatestProducts extends StatefulWidget {
  const LatestProducts({Key key}) : super(key: key);
  @override
  _LatestProductsState createState() => _LatestProductsState();
}
class _LatestProductsState extends State<LatestProducts> {
  AllProductsModel allproducts;
  AllProductsModel allproducts2;
 String userid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Api.getHomeProducts().then((value) {
      setState(() {
        allproducts=value;
      });
    });
    Api.getAllProducts(6).then((value2) {
      setState(() {
        allproducts2=value2;
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
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: "${getTranslated(context, 'Latest_Products')}", press: () {}),
        ),
        SizedBox(height:20),

    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    children: [
    ...List.generate(
      allproducts==null? 5:allproducts.allProducts.length,
    //  snapshot.data.allProducts.length,
    (index) {
    // if (snapshot.data.allProducts[index].isOffer==1)
    return allproducts2==null?Container():ProductCard(product:allproducts==null? allproducts2.allProducts[index]:allproducts.allProducts[index],userid: userid,);
    return SizedBox
        .shrink(); // here by default width and height is 0
    },
    ),
    SizedBox(width: 20),
    ],
    ),
    )

      ],
    );
  }
}