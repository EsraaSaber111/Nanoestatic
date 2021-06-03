import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/offres.dart';
import 'package:shop_app/models/wishlist.dart';
import 'package:shop_app/screens/offers/components/all_product_card.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/wishlist/components/wish_card.dart';
import 'package:shop_app/service/Api.dart';
import 'package:shop_app/service/OffersApi.dart';

import '../../../constants.dart';
class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Wishlist>wish;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wish=Api.getwish(8);
  }

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
                    // margin: EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                      //  color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  FutureBuilder<Wishlist>(
                  future: wish,
                      builder: (_,snapshot){
                    if(snapshot.hasData){
                    print(snapshot.data.message);
                      return ListView.builder(
                        // here we use our demo procuts list
                        itemCount:snapshot.data.allWishListProducts.length,
                        itemBuilder: (context, index) =>
                            wishcart(
                          itemIndex: index,
                          wish: snapshot.data.allWishListProducts[index],
                          press: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(snapshot.data.allWishListProducts[index].id)));
                          },
                        ),
                      );

                    }
                    else if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }else{
                      return Center(child: Text('error'),);
                    }
                      })
                ],
              ),
            ),
          ],
        ),
      );
    }

}

