import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';

import '../../dphelper.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';


class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

 // SQL_Helper helper = new SQL_Helper();
  int len=0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        len=value.getInt('length');
        print("len $len");
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${counts??0} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }

}
