import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/Provider/provider.dart';
import 'package:nanoestatic/constants.dart';
import 'package:nanoestatic/models/Cart.dart';
import 'package:nanoestatic/screens/home/components/icon_btn_with_counter.dart';

import '../../helper/dphelper.dart';
import '../../size_config.dart';

import 'components/cart_card.dart';
import 'components/check_out_card.dart';


class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> {
  SQL_Helper helper = SQL_Helper();
  List<ProductCart> carts;

  int len=0;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      helper.getDataList().then((value) {
        setState(() {
          carts=value;
        });
      });
      helper.getDataList().then((items) => SharedPreferences.getInstance().then((value) => value.setInt('length',items.length)));
    });

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
    final themeColor = Provider.of<Provider_control>(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: carts==null?Center(child: CircularProgressIndicator(),):ListView.builder(
            itemCount: carts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    helper
                        .deleteCart(carts[index].id)
                        .whenComplete(() {
                      print("deleted");

                      helper.getDataList().then((value) {
                        setState(() {
                          carts=value;
                        });
                      });

                      helper.getCount().then((value) {setState(() {
                        themeColor.setCount(value);
                      });});
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
                child: CartCard(cart:carts[index]),
              ),
            ),
          )
      ),
      bottomNavigationBar: CheckoutCard(carts: carts),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final count = Provider.of<Provider_control>(context);

    return AppBar(
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: IconButton(
      //       icon: Icon(Icons.delete,color: Colors.red,),
      //       onPressed: (){
      //
      //         setState(() {
      //           helper.deleteall();
      //             helper.getCount().then((value) {setState(() {
      //               count.setCount(value);
      //             });});
      //           });
      //
      //
      //       },
      //     ),
      //   )
      //
      // ],
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${count.getcount()??00} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }

}
