import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/all_products_model.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
class ProductCategoryCard extends StatelessWidget {
  AllProducts product;
  ProductCategoryCard(
      this.product
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10), right: getProportionateScreenWidth(10),),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        child: GestureDetector(
          ///go to details page
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(product.id)));

          },
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
                    tag: 'tagid${product.id}',
                  ///have to get image URL
                    child: Image.network('${imageURl+product.mainImage}'),
                  // child: Image.asset("assets/images/1.png"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.data.title,
                style: TextStyle(color: Colors.black),
                maxLines: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.lastPrice}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: product.isOffer==1
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product.isOffer==1
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
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
