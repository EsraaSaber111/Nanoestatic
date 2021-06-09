import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/CompeleteOrder.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/complete_order/complete_order.dart';
import 'package:shop_app/service/Api.dart';

import '../../../dphelper.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatefulWidget {
  List<ProductCart> carts;
  CheckoutCard({this.carts});
  Product_model product;
  @override
  _CheckoutCadState createState() => _CheckoutCadState();
}

class _CheckoutCadState extends State<CheckoutCard> {
 static double total = 0;
  String calculateTotal() {
    setState(() {
      if(widget.carts!=null){
        total = 0;
        widget.carts.forEach((f) {
          Api.getproductdetails(f.product_id).then((value) {
            setState(() {
              widget.product = value;
            });
          });
          total += f.numOfItem * widget.product.product.lastPrice;
// if(widget.product!=null){
//
// }

        });
      }

    });
    return num.parse(total.toStringAsFixed(10)).toString();
  }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     widget.maxtotal=widget.total;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///todo:get calculation
                // Text.rich(
                //   TextSpan(
                //     text: "Total:\n",
                //     children: [
                //       TextSpan(
                //         text: "\$ ${calculateTotal()}",
                //         style: TextStyle(fontSize: 16, color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {

                      // helper.deleteall();
                      Navigator.pushNamed(
                          context,
                          CompleteOrder.routeName);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
