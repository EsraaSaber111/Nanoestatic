import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';
import 'package:html/parser.dart' show parse;
import '../size_config.dart';


class ProductDescription extends StatefulWidget {

  dynamic product;
  ProductDescription(this.product);
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {

  bool clicked=false;

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
setState(() {
  clicked=!clicked;
});
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
              20
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description',style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.bold),

              ),
              SizedBox(height: 10,),
              Text(
                '${parse(widget.product.data.content).body.text}',
                maxLines: 10,
              ),
            ],

          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: getProportionateScreenWidth(20),
        //     vertical: 10,
        //   ),
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Row(
        //       children: [
        //         Text(
        //           "See More Detail",
        //           style: TextStyle(
        //               fontWeight: FontWeight.w600, color: kPrimaryColor),
        //         ),
        //         SizedBox(width: 5),
        //         Icon(
        //           Icons.arrow_forward_ios,
        //           size: 12,
        //           color: kPrimaryColor,
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }

}
