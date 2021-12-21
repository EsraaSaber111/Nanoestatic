import 'package:flutter/material.dart';
import 'package:nanoestatic/components/offer_card.dart';
import 'package:nanoestatic/localization/language_constants.dart';

import 'package:nanoestatic/models/offres.dart';
import 'package:nanoestatic/screens/mainpage/mainpagescreen.dart';
import 'package:nanoestatic/screens/offers/offers_screen.dart';

import 'package:nanoestatic/service/OffersApi.dart';

import '../../../size_config.dart';
import 'section_title.dart';


class LatestOffers extends StatefulWidget {
  const LatestOffers({Key key}) : super(key: key);

  @override
  _LatestOffersState createState() => _LatestOffersState();
}

class _LatestOffersState extends State<LatestOffers> {
  Future<Offres> offers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offers=OffersApi.getAllOffers();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: "${getTranslated(context, 'Latest_Offers')}", press: () {
            Navigator.of(context).pushNamedAndRemoveUntil(OfferScreen.routeName, ModalRoute.withName(MainPage.routeName));
          }),
        ),
        SizedBox(height:20),
        FutureBuilder<Offres>(
          future: offers,
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

                          return OfferCard(product: snapshot.data.allProducts[index]);

                        return SizedBox
                            .shrink(); // here by default width and height is 0
                      },
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              );

          }else if(snapshot.connectionState==ConnectionState.waiting){
              return Center();
            }else{
              return Center(child: Text('not found'),);
            }
          },
        )
      ],
    );
  }

}
