import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/components/Products_Category_Card.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/category.dart';

import 'components/body.dart';

class SpecificScreen extends StatelessWidget {
  static String routeName = "/specific";
  CategoryModel categoryModel;
  SpecificScreen(this.categoryModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productsbody(),
      drawer: Drawer(
        child: drawer(),
      ),
    );
  }

 Widget productsbody() {

   return   Scaffold(
      appBar: AppBar(title: Text('${categoryModel.name}'),),
     body: SafeArea(
         child: AnimationLimiter(
           child: GridView.count(
               crossAxisCount: 2,
               mainAxisSpacing: 2,
               crossAxisSpacing: 10,
               childAspectRatio: 0.8,
               children:
               List.generate(categoryModel.product.length, (index)
               {
                 return Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: AnimationConfiguration.staggeredGrid(
                         columnCount: 2,
                         position: index,
                         duration: const Duration(milliseconds: 375),
                         child: ScaleAnimation(
                           scale: 0.5,
                           child: FadeInAnimation(
                             child: InkWell(
                               child: ProductCategoryCard(categoryModel.product[index]),
                               //               onTap: () => Navigator.pushNamed(
                               // context,
                               //                 DetailsScreen.routeName,
                               // arguments: ProductDetailsArguments(product: courses[index]),
                               //             ),

                             ),
                           ),
                         )
                     )
                 );
               }
               ).toList()),
         )),
   );

 }
}





