import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/all_categories_model.dart';
import 'package:shop_app/screens/home/components/special_categories.dart';
import 'package:shop_app/screens/specific_products/SpecificScreen.dart';
import 'package:shop_app/service/Api.dart';
import '../../../api_constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<AllCategoriesModel> allcategories;

  List<StaggeredTile> _staggeredTiles = [

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allcategories = Api.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text("${getTranslated(context, 'Categories')}"),
      ),
      drawer: Drawer(
        child: drawer(),
      ),
      body: SafeArea(
        child: FutureBuilder<AllCategoriesModel>(
            future: allcategories,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                // return Center(child: Text('${snapshot.data.allCategories.length}'),);
                return AnimationLimiter(
                  child: GridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 0.2,
                    childAspectRatio:2.5,
                   // padding: const EdgeInsets.all(5.0),
                    //crossAxisCount: snapshot.data.allCategories.length,
                    children: List.generate(
                      snapshot.data.allCategories.length,
                      (int index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: snapshot.data.allCategories.length,
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                            scale: 0.5,
                            child: FadeInAnimation(
                                child: SpecialOfferCard(
                                  width: 335,
                                  image: '${imageURl+snapshot.data.allCategories[index].mainImage}',
                                  category:"${snapshot.data.allCategories[index].data.name}",
                                  numOfBrands:'${    snapshot.data
                                      .allCategories[index]
                                      .data
                                      .description}',
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SpecificScreen(
                                                    snapshot
                                                        .data
                                                        .allCategories[index]
                                                        .id,
                                                    snapshot
                                                        .data
                                                        .allCategories[index]
                                                        .data
                                                        .description)));
                                  },
                                )
                                // InkWell(
                                //     child: Padding(
                                //       padding: EdgeInsets.all(
                                //           getProportionateScreenWidth(2)),
                                //       child: GestureDetector(
                                //         child: SizedBox(
                                //           width:
                                //               getProportionateScreenWidth(242),
                                //           height:
                                //               getProportionateScreenWidth(100),
                                //           child: ClipRRect(
                                //             borderRadius:
                                //                 BorderRadius.circular(20),
                                //             child: Stack(
                                //               children: [
                                //                 Container(
                                //
                                //                 width: getProportionateScreenWidth(242),
                                //               //  height: 100,
                                //                 decoration: BoxDecoration(
                                //                   image: DecorationImage(
                                //                 fit: BoxFit.fill,
                                //                 image: NetworkImage(
                                //                     '${imageURl+snapshot.data.allCategories[index].mainImage}',
                                //                   //  height: width,
                                //
                                //                 ),
                                //                   ),
                                //                   ),
                                //                 ),
                                //                 Container(
                                //                   decoration: BoxDecoration(
                                //                     gradient: LinearGradient(
                                //                       begin:
                                //                           Alignment.topCenter,
                                //                       end: Alignment
                                //                           .bottomCenter,
                                //                       colors: [
                                //                         Color(0xFF343434)
                                //                             .withOpacity(0.4),
                                //                         Color(0xFF343434)
                                //                             .withOpacity(0.15),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 Padding(
                                //                   padding: EdgeInsets.symmetric(
                                //                     horizontal:
                                //                         getProportionateScreenWidth(
                                //                             15.0),
                                //                     vertical:
                                //                         getProportionateScreenWidth(
                                //                             10),
                                //                   ),
                                //                   child: Text.rich(
                                //                     TextSpan(
                                //                       style: TextStyle(
                                //                           color: Colors.white),
                                //                       children: [
                                //                         TextSpan(
                                //                           text:
                                //                               "${snapshot.data.allCategories[index].data.name}\n",
                                //                           style: TextStyle(
                                //                             fontSize:
                                //                                 getProportionateScreenWidth(
                                //                                     18),
                                //                             fontWeight:
                                //                                 FontWeight.bold,
                                //                           ),
                                //                         ),
                                //                         TextSpan(
                                //                             text:
                                //                                 "${snapshot.data.allCategories[index].data.description} \n"),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     onTap: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   SpecificScreen(
                                //                       snapshot
                                //                           .data
                                //                           .allCategories[index]
                                //                           .id,
                                //                       snapshot
                                //                           .data
                                //                           .allCategories[index]
                                //                           .data
                                //                           .description)));
                                //     })

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
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text('error'),
                );
              }
            }),
      ),
    );
  }


}
