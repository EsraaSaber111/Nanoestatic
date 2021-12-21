import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/Provider/provider.dart';
import 'package:nanoestatic/screens/home/components/slider.dart';
import 'package:nanoestatic/screens/home/components/special_categories.dart';

import '../../../size_config.dart';
import 'LatestProducts.dart';

import 'home_header.dart';
import 'latest_offers.dart';


class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {

  int len=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        len = value.getInt('length');
        Provider.of<Provider_control>(context,listen: false).setCount(value.getInt('length'));
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(len),
            SizedBox(height: getProportionateScreenWidth(20)),
            Slidercard(),
            SizedBox(height: getProportionateScreenWidth(20)),
            SpecialCategories(),
            SizedBox(height: getProportionateScreenWidth(20)),
            LatestOffers(),
            SizedBox(height: getProportionateScreenWidth(20)),
            LatestProducts(),
            SizedBox(height: getProportionateScreenWidth(20)),

          ],
        ),
    );
  }

}

