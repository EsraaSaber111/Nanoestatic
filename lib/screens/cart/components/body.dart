import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/Provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../dphelper.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SQL_Helper helper = SQL_Helper();
  Future<List<ProductCart>> carts;

  @override
  void initState() {
    setState(() {
      carts = helper.getDataList();
      helper.getDataList().then((items) => SharedPreferences.getInstance().then((value) => value.setInt('length',items.length)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<Provider_control>(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: FutureBuilder<List<ProductCart>>(
          future: carts,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        helper
                            .deleteCart(snapshot.data[index].id)
                            .whenComplete(() {
                          print("deleted");
                          setState(() {
                            carts = helper.getDataList();

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
                    child: CartCard(snapshot.data[index]),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text('no products'),
              );
            }
          }),
    );
  }
}
