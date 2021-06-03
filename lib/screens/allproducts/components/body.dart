import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';


import '../../../constants.dart';
import 'category_list.dart';
import '../../offers/components/all_product_card.dart';

class Body extends StatelessWidget {
   Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
        //  SearchBox(onChanged: (value) {}),
         // CategoryList(),
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),

                ///have to uncomment this and handle it

                // ListView.builder(
                //   // here we use our demo procuts list
                //   itemCount: demoProducts.length,
                //   itemBuilder: (context, index) => allProductCard(
                //     itemIndex: index,
                //     product: demoProducts[index],
                //     press: () {
                //       Navigator.pushNamed(
                //         context,
                //         DetailsScreen.routeName,
                //         arguments: ProductDetailsArguments(product: demoProducts[index]),
                //       );
                //       },
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
