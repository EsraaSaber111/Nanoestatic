import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/localization/language_constants.dart';
import 'package:nanoestatic/models/Product.dart';
import 'package:html/parser.dart' show parse;
import 'package:nanoestatic/models/product_model.dart';
import 'package:nanoestatic/service/WishlistApi.dart';
import '../size_config.dart';


class ProductDescription extends StatefulWidget {

  MyProduct product;
  String user_id;
  ProductDescription(this.product, this.user_id);
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {

  bool clicked=false;

  String isfav = "";
  String getifav() {
    WishlistApi.ifwishlist('wishlist/check?',widget.product.id, int.parse(widget.user_id))
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
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.data.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  width: getProportionateScreenWidth(64),
                  decoration: BoxDecoration(
                    color:clicked? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: InkWell(
                    onTap: (){
                      if (isfav == "product exist") {
                        WishlistApi.deletewishlist(
                            'wishlist/delete?', widget.product.id, int.parse(widget.user_id)).then((value) {
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
                        WishlistApi.addwishlist('wishlist/add?', widget.product.id, int.parse(widget.user_id)).then((value) {
                          print(value);
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('${value}')));
                        });
                        setState(() {
                          clicked = !clicked;
                        });
                      };
                    },
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: clicked ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      height: getProportionateScreenWidth(16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.all(
              getProportionateScreenWidth(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${getTranslated(context,'Description')}',style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.bold),

              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              Text(
                '${parse(widget.product.data.content).body.text}',
                maxLines: 10,
              ),
            ],

          ),
        ),
      ],
    );
  }

}
