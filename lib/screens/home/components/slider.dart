import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class Slidercard extends StatelessWidget {
  Product product;
  final cardInfoDecoration =  BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: kCardInfoBG.withOpacity(0.2),
  );

  final likedWidgetDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white
  );
  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options: CarouselOptions(
      height: getProportionateScreenHeight(300),
      viewportFraction: 0.9,
      aspectRatio: 16 / 9,
      autoPlay: true,
      enlargeCenterPage: true,
      ),
      items: sliderdemo.map(
            (url) {
          return Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: cardInfoDecoration,
                    //color: Colors.blueGrey,
                   // margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        url.img,
                        fit: BoxFit.cover,

                        width: getProportionateScreenWidth(320),
                      ),
                    ),
                  ),
                ],
              ),
              //  Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       width: double.infinity,
              //     //  height: 200,
              //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //       decoration: cardInfoDecoration,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //           //  mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 url.name,
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 10,
              //                   fontWeight: FontWeight.w700
              //                 ),
              //               ),
              //
              //               Spacer(),
              //
              //              // LikedButton()
              //             ],
              //           ),
              //
              //           SmoothStarRating(
              //             allowHalfRating: false,
              //             onRated: (v) {},
              //             starCount: 5,
              //             rating: url.rating,
              //             size: 20,
              //             isReadOnly: true,
              //             color: kRatingStarColor,
              //             borderColor: kRatingStarColor,
              //           )
              //         ],
              //       ),
              //     )
              //   ],
              // ),
















              //-----------------------------------------
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: <Widget>[
              //         Text(
              //           "Sunny Getaways",
              //           style: TextStyle(color: Colors.white, fontSize: 24),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //           child: Text(
              //               "Lorem Ipsım Dolar Lorem Ipsım Dolar Lorem Ipsım Dolar",
              //               style:
              //               TextStyle(color: Colors.white, fontSize: 14)),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          );
        },
      ).toList(),
    );
    }

  }

