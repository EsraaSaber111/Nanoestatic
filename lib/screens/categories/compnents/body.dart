import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/screens/specific_products/SpecificScreen.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  List<StaggeredTile> _staggeredTiles = [
    StaggeredTile.count(4, 2),
    StaggeredTile.count(4, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
  ];

  @override
  Widget build(BuildContext context) {
    var columnCount = 4;

    return Scaffold(
      appBar: AppBar(title: Text('Categories'),),
      drawer: Drawer(
        child: drawer(),
      ),
      body: SafeArea(
        child: AnimationLimiter(
          child: StaggeredGridView.count(

            //crossAxisCount: 4,
            staggeredTiles: _staggeredTiles,
            // children: _tiles,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8.0,

            // childAspectRatio: 1.0,
            padding: const EdgeInsets.all(20.0),
            crossAxisCount: columnCount,
            children: List.generate(
              demoCategory.length,
                  (int index) {
                return AnimationConfiguration.staggeredGrid(
                  columnCount: columnCount,
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child:  ScaleAnimation(
                    scale: 0.5,
                    child: FadeInAnimation(
                      child:
                        InkWell(child: CardDesign(index),
                          onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecificScreen(demoCategory[index])));
                          }

                        )

                      // Card(
                      //   elevation: 4,
                      //   child: Text(categories[index].name),
                      //
                      // ),




                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),

    );
  }

  Widget CardDesign(int index) {
    return Padding(
      padding: EdgeInsets.all( getProportionateScreenWidth(2)),
      child: GestureDetector(

        child: SizedBox(
          width: getProportionateScreenWidth(242),
           height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        demoCategory[index].img,
                       // height: 400,
                       // width: 314,

                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "${demoCategory[index].name}\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "${demoCategory[index].product.length} Product")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }
  }

