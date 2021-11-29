import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Provider/provider.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/all_categories_model.dart';
import 'package:shop_app/screens/categories/categories_screen.dart';
import 'package:shop_app/screens/specific_products/SpecificScreen.dart';
import 'package:shop_app/service/Api.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialCategories extends StatefulWidget {
  const SpecialCategories({Key key}) : super(key: key);

  @override
  _SpecialCategoriesState createState() => _SpecialCategoriesState();
}

class _SpecialCategoriesState extends State<SpecialCategories> {

  Future<AllCategoriesModel> allcategories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allcategories=Api.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "${getTranslated(context, 'Categories')}",
            press: () {
              Navigator.pushNamed(
                  context,
                  CategoriesScreen.routeName);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder<AllCategoriesModel>(
          future: allcategories,
          builder: (_,snapshot){
            if(snapshot.hasData){
              return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [

                        ...List.generate(
                          2,
                          // snapshot.data.allProducts.length,
                              (index) {

                            return  SpecialOfferCard(
                              width: 250,
                              image: '${imageURl+snapshot.data.allCategories[index].mainImage}',
                              category:"${snapshot.data.allCategories[index].data.name}",
                              numOfBrands:'${getTranslated(context, 'product')}',
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
                            );

                            return SizedBox
                                .shrink(); // here by default width and height is 0
                          },
                        ),

                        // SpecialOfferCard(
                        //   image: '${imageURl+snapshot.data.allCategories[1].mainImage}',
                        //   category:"${snapshot.data.allCategories[1].data.name}",
                        //   numOfBrands: 24,
                        //   press: () {},
                        // ),

                      ]
                  )
              );

            }else if(snapshot.connectionState==ConnectionState.waiting){
              return Center();
            }else{
              return Center(child: Text('not found'),);
            }
            }
    ),

                SizedBox(width: getProportionateScreenWidth(20)),
              ]
    );

  }
}



class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
    @required this.width
  }) : super(key: key);

  final String category, image;
  final String numOfBrands;
  final GestureTapCallback press;
  final double width;

  @override
  Widget build(BuildContext context) {
    //double width=250;
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                     // height: 100,
                      width: getProportionateScreenWidth(width),
                decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                      image:
                     NetworkImage(
                        image,
                      ),
                ),
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
                          text: "$category\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(text: "${numOfBrands}",style: TextStyle(fontSize:  getProportionateScreenWidth(18)))
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