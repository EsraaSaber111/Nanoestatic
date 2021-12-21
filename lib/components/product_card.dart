import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanoestatic/api_constants.dart';
import 'package:nanoestatic/models/all_products_model.dart';
import 'package:nanoestatic/screens/details/details_screen.dart';
import 'package:nanoestatic/service/WishlistApi.dart';
import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
    @required this.userid,
  }) : super(key: key);

  final double width, aspectRetio;
  final AllProducts product;
  final String userid;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isliked;
  bool clicked=false;
  String isfav = "";

  String getifav() {
    WishlistApi.ifwishlist('wishlist/check?',widget.product.id, int.parse(widget.userid))
        .then((value) {
      print(value);
      setState(() {
        isfav = value;
      });
      if(isfav=="product exist"){
        clicked=true;
      }else{
        clicked=false;
      }
      return isfav;
    });
  }
  @override
  void initState() {

    getifav();
    // TODO: implement initState
    super.initState();
   // onLikeButton();
    print('${widget.userid}');
    print('${widget.product.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          //todo:handle it

          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(widget.product.id))),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                  ),
                  child: Hero(
                    tag: (widget.product.id + 69).toString(),
                    child:
                        Image.network('${imageURl + widget.product.mainImage}'),
                  ),
                ),
              ),
               SizedBox(height: getProportionateScreenHeight(20)),
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
                    onTap: (){
                           if (isfav == "product exist") {
                             WishlistApi.deletewishlist(
                                 'wishlist/delete?', widget.product.id, int.parse(widget.userid)).then((value) {
                               print(value);
                               Scaffold.of(context).showSnackBar(
                                   SnackBar(content: Text('${value}')));
                             });

                             // Scaffold.of(context).showSnackBar(
                             //    SnackBar(content: Text('already exists')));
                             setState(() {
                               clicked = !clicked;
                             });
                           }
                           else{
                             WishlistApi.addwishlist('wishlist/add?', widget.product.id, int.parse(widget.userid)).then((value) {
                               print(value);
                               Scaffold.of(context).showSnackBar(SnackBar(content: Text('${value}')));
                             });
                             setState(() {
                               clicked = !clicked;
                             });
                           };
                    },

                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: widget.product.isOffer == 1
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        ///todo: if product fav or not
                        color: clicked ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      ),
                   ),
                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(50)),

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
