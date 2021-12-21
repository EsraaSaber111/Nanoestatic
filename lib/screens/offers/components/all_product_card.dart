import 'package:flutter/material.dart';
import 'package:nanoestatic/api_constants.dart';
import 'package:nanoestatic/models/Product.dart';
import 'package:nanoestatic/models/offres.dart';


import '../../../constants.dart';
import '../../../size_config.dart';

class allProductCard extends StatelessWidget {
  const allProductCard({
    Key key,
   this.itemIndex,
    this.product,
    this.press,
  }) : super(key: key);

  final int itemIndex;
  final AllProducts product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,
      height: 160,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: kSecondaryColor,
                boxShadow: [kDefaultShadow],
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // our product image
            Positioned(
              top: 0,
              bottom: 5,
              right: 0,
              child: Hero(
                tag: '${product.id}',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding+30),
                  height: 100,
                  // image is square but we add extra 20 + 20 padding thats why width is 200
                  width: 200,
                  ///have to handle image
                  child: Image.network(
                    '${imageURl+product.mainImage}',
                   fit: BoxFit.cover,
                     height: 200,
                     width: 400,
                  ),
                ),
              ),
            ),

            // Product title and price
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // our image take 200 width, thats why we set out total width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        product.data.title,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.black,
                        ),
                       // style: Theme.of(context).textTheme.headline6,
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                       ' ${product.lastPrice} \$',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        // style: Theme.of(context).textTheme.headline6,
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        ' ${product.totalQuantity} \$',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                        // style: Theme.of(context).textTheme.headline6,
                      ),

                    ),
                    // it use the available space
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5, // 30 padding
                        vertical: kDefaultPadding / 4, // 5 top and bottom
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: Text(
                        "50 % off",
                        style: TextStyle(color: Colors.white),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
