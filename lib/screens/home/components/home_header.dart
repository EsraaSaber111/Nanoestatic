import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding:
    //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text(
    //         "MESOESTATIC",
    //         style: TextStyle(
    //           fontSize: getProportionateScreenWidth(25),
    //           color: kPrimaryColor,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //      // SearchField(),
    //       IconBtnWithCounter(
    //         svgSrc: "assets/icons/Cart Icon.svg",
    //         press: () => Navigator.pushNamed(context, CartScreen.routeName),
    //       ),
    //       IconBtnWithCounter(
    //         svgSrc: "assets/icons/Bell.svg",
    //         numOfitem: 3,
    //         press: () {},
    //       ),
    //     ],
    //   ),
    // );

      return AppBar(
        elevation: 0,
        centerTitle: false,
        title:  Text(
                  "MESOESTATIC",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(25),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

        actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconBtnWithCounter(
                    numOfitem: 3,
                    svgSrc: "assets/icons/Cart Icon.svg",
                    press: () => Navigator.pushNamed(context, CartScreen.routeName),
                  ),
                ),
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconBtnWithCounter(
                    svgSrc: "assets/icons/User.svg",

                    press: () {
                      Navigator.pushNamed(context, ProfileScreen.routeName);
                    },
                  ),
                ),
        ],
      );
  }
}
