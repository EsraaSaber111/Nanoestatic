import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/api_constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/all_products_model.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/service/Api.dart';
import 'package:shop_app/service/WishlistApi.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {

  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);


  final double width, aspectRetio;
  final AllProducts product;
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  String id;
 bool clicked=false;
 String isfav="";

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getifav();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        id = value.getString('id');
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          //todo:handle it

          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(widget.product.id))),

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
                    tag: (widget.product.id+69).toString(),
                    child: Image.network('${imageURl+widget.product.mainImage}'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.data.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.product.lastPrice}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      if(isfav=="product exist"){
                        WishlistApi.deletewishlist('wishlist/delete?', widget.product.id, int.parse(id)).then((value) {
                           print(value);
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('${value}')));
                        });

                        setState(() {
                          clicked=!clicked;
                        });
                      }
                    else{
                        WishlistApi.addwishlist('wishlist/add?', widget.product.id, 8).then((value) {
                          // print(value);
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('${value}')));
                        });
                        setState(() {
                          clicked=!clicked;
                        });
                      }


                    },
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: widget.product.isOffer==1
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child:  SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          ///todo: if product fav or not
                          color: isfav=="product exist"
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
String getifav(){
  WishlistApi.ifwishlist('wishlist/check?', widget.product.id , 8).then((value) {
      print(value);
      setState(() {
        isfav=value;
      });
      return isfav;
     // Scaffold.of(context).showSnackBar(SnackBar(content: Text('${value.message}')));
    });
}
}
