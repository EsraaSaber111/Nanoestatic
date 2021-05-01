import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/complete_order/complete_order.dart';
import 'package:shop_app/screens/details/components/product_description.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
    Container(height: getProportionateScreenHeight(250),
    width: getProportionateScreenWidth(200),
    child: AspectRatio(
    aspectRatio: 1,
    child: Hero(
    tag: product.id.toString(),
    child: Image.asset(product.img,fit: BoxFit.fitWidth,
  ),
    ),
    ),
    ),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [

              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              //Text('Specs',style: TextStyle(fontWeight: FontWeight.w400),),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    //   Price(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Apply Course",
                          press: () {
                            Navigator.pushNamed(
                                context,
                                CompleteOrder.routeName);

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
