import 'package:flutter/material.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/service/Api.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  ProductCart cart;
  CartCard(this.cart);
  Future<Product_model> product;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.product = Api.getproductdetails(widget.cart.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product_model>(
        future: widget.product,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
         // demoCarts.add(ProductCart(id: snapshot.data.product.id,numOfItem: 3));
            return Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                          '${imageURl + snapshot.data.product.mainImage}'),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${snapshot.data.product.data.title}',
                      //  cart.data.title,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "\$${snapshot.data.product.lastPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: " x${snapshot.data.product.totalQuantityAdded}",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    )
                  ],
                )
              ],
            );

          } else {
            return Center();
          }
        });
  }
}
