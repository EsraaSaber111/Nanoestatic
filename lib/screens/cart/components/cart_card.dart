import 'package:flutter/material.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/service/Api.dart';
import '../../../constants.dart';
import '../../../dphelper.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  ProductCart cart;
  CartCard(this.cart);
  SQL_Helper helper = new SQL_Helper();
  Future<Product_model> product;
  @override
  _CartCardState createState() => _CartCardState();
}

// cart=await helper.updateCartCount(cart.id);
// cart.quantity++;
// result = await helper.updateCart(cart);



class _CartCardState extends State<CartCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.product = Api.getproductdetails(widget.cart.product_id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product_model>(
        future: widget.product,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: "\$${snapshot.data.product.lastPrice}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor),
                              children: [
                                TextSpan(text: "x"),
                              ]),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 15,
                                  ),
                                  onPressed: () {

                                    setState(() {
                                     widget.helper.updateCartCount(widget.cart.id).then((value) {
                                       widget.cart=value;
                                        widget.cart.numOfItem++;
                                        widget.helper.updateCart(widget.cart);
                                      });

                                    });
                                 //   widget.helper.updateCart(ProductCart(product_id: snapshot.data.product.id,numOfItem: widget.cart.numOfItem));
                                    print("updated${widget.cart.numOfItem}");
                                  }),
                              Text('${widget.cart.numOfItem}'),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: IconButton(
                                    icon: Icon(Icons.minimize, size: 15),
                                    onPressed: () {
                                      setState(() {
                                        if (widget.cart.numOfItem == 1) {
                                          return;
                                        } else
                                          widget.helper.updateCartCount(widget.cart.id).then((value) {
                                            widget.cart=value;
                                            widget.cart.numOfItem--;
                                            widget.helper.updateCart(widget.cart);
                                          });
                                          widget.cart.numOfItem--;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
