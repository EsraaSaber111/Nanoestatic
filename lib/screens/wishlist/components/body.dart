import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:nanoestatic/models/wishlist.dart';
import 'package:nanoestatic/screens/details/details_screen.dart';
import 'package:nanoestatic/screens/wishlist/components/wish_card.dart';
import 'package:nanoestatic/service/WishlistApi.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Wishlist wish;
  String userid;
  getdata(){
    SharedPreferences.getInstance().then((pref) async {
      WishlistApi.getwish(int.parse(pref.getString('id'))).then((value) {
        setState(() {
          wish = value;
          userid=pref.getString('id');
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  decoration: BoxDecoration(
                    //  color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                wish == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        // here we use our demo procuts list
                        itemCount: wish.allWishListProducts.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {

                              setState(() {
    WishlistApi.deletewishlist("wishlist/delete?", wish.allWishListProducts[index].id, int.parse(userid)).whenComplete(() {

      print("deleted");
      WishlistApi.getwish(int.parse(userid)).then((value) {
       setState(() {
         wish=value;
       });
      });

    });


                              });
                            },

                            background: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE6E6),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Spacer(),
                                  SvgPicture.asset("assets/icons/Trash.svg"),
                                ],
                              ),
                            ),
                            child: wishcart(
                              itemIndex: index,
                              wish: wish.allWishListProducts[index],
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                            wish.allWishListProducts[index].id,)));
                              },
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
