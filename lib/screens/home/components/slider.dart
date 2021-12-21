import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nanoestatic/constants.dart';
import 'package:nanoestatic/models/Product.dart';
import 'package:nanoestatic/models/slider.dart';
import 'package:nanoestatic/service/Api.dart';
import 'package:nanoestatic/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../api_constants.dart';

class Slidercard extends StatefulWidget {
  const Slidercard({Key key}) : super(key: key);

  @override
  _SlidercardState createState() => _SlidercardState();
}

class _SlidercardState extends State<Slidercard> {

  showdialogfun(context,img)
  {
    return showDialog(context: context,
        builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.white),
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.8,
            child: Image.network(img) ,
          ),
        ),
      );
    });
  }



  Future<Sliders> sliders;
  final cardInfoDecoration =  BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: kCardInfoBG.withOpacity(0.2),
  );

  final likedWidgetDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliders=Api.getSlider();
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Sliders>(
      future: sliders,
      builder: (_,snapshot){
        if(snapshot.hasData){
          return
            CarouselSlider(
                options: CarouselOptions(
                  height: getProportionateScreenHeight(300),
                  viewportFraction: 0.9,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items:
                List.generate(snapshot.data.allSliders.length, (index) {
                      return Stack(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: cardInfoDecoration,
                                //color: Colors.blueGrey,
                                // margin: EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: (){
                                    showdialogfun(context,imageURl+snapshot.data.allSliders[index].image);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    child: Image.network(
                                      '${imageURl+snapshot.data.allSliders[index].image}',
                                      // {}url.img,
                                      fit: BoxFit.cover,

                                      width: getProportionateScreenWidth(320),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      );
                })
              // snapshot.data.allSliders.map(
              //       (url) {
              //     return Stack(
              //       children: <Widget>[
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Container(
              //               decoration: cardInfoDecoration,
              //               //color: Colors.blueGrey,
              //               // margin: EdgeInsets.all(5.0),
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 child: Image.network(
              //                   '${imageURl+url.image}',
              //                   // {}url.img,
              //                   fit: BoxFit.cover,
              //
              //                   width: getProportionateScreenWidth(320),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //
              //       ],
              //     );
              //   },
              // ).toList()
            );
        }else if(snapshot.connectionState==ConnectionState.waiting){
          return Center();
        }
        else{
          return Center(child: Text('error'),);
        }
      }

    );
  }

}

