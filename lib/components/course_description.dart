import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/parser.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/course_model.dart';
import 'package:shop_app/models/product_model.dart';
import '../size_config.dart';


class CourseDescription extends StatefulWidget {
  Course product;
  CourseDescription(this.product);

  @override
  _CourseDescriptionState createState() => _CourseDescriptionState();
}

class _CourseDescriptionState extends State<CourseDescription> {

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
              InkWell(
                onTap:(){
setState(() {
  clicked=!clicked;
});
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    width: getProportionateScreenWidth(64),
                    decoration: BoxDecoration(
                      color: clicked
                          ? Color(0xFFFFE6E6)
                          : Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: clicked
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                      height: getProportionateScreenHeight(16),
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
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(getTranslated(context, 'Description'),style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.bold),

              ),
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
