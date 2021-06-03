import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/offres.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final AllProducts product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          //todo:handle on click
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(product.id))),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: (product.id+50).toString(),
                    child: Image.network('${imageURl+product.mainImage}'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.data.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.lastPrice}",
                    style: TextStyle(
                     // decoration: TextDecoration.lineThrough,
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                   // borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
                    onTap: () {},
                    child: Container(
                    //  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                      height: getProportionateScreenWidth(25),
                      width: getProportionateScreenWidth(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
                        color: Colors.redAccent,
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "50%",
                          style: TextStyle(color: Colors.white),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.lastPrice}",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: getProportionateScreenWidth(12),
                      fontWeight: FontWeight.w200,
                      color: kPrimaryColor.withOpacity(0.8),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}