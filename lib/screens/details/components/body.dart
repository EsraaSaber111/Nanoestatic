import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/components/default_button.dart';
import 'package:nanoestatic/components/doctor_serial.dart';
import 'package:nanoestatic/models/product_model.dart';
import 'package:nanoestatic/service/Api.dart';
import 'package:nanoestatic/size_config.dart';
import '../../../components/product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  Future<Product_model> productdetails;
  int product_id;
  String userid;
  Body(this.product_id);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.productdetails=Api.getproductdetails(widget.product_id);

    SharedPreferences.getInstance().then((pref) {
      setState(() {
        widget.userid = pref.getString('id');
        print(widget.userid);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product_model>(
      future: widget.productdetails,
      builder: (_,snapshot){
      if(snapshot.hasData){
        return ListView(
          children: [
           ProductImages(snapshot.data.product.productImages),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    snapshot.data.product,widget.userid
                  ),
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
                              text: "Add To Cart",
                              press: () {
                                /// todo:doctor serial dialog should be active
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomDialogs(
                                        product_id: snapshot.data.product.id,
                                        title: 'Enter Doctor Serial',
                                        buttontext1: 'Done',
                                        buttontext2: 'Cancel',
                                      );
                                    });

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
      }else if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else{
        return Center(child: Text('error'),);
      }
      },

    );
  }
}

