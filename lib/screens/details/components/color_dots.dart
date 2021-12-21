import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanoestatic/components/rounded_icon_btn.dart';
import 'package:nanoestatic/models/Product.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Price extends StatefulWidget {

  const Price({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {

  double price;
  int itemcount=1;
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Text(
              '${widget.product.price*itemcount} \$',
              style: GoogleFonts.tinos(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500
              )
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                if(itemcount==1){
                  return;
                }else
                  itemcount--;
              });
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text('${itemcount}'),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              setState(() {
                itemcount++;
              });
            },
          ),
        ],
      ),
    );
  }

}



