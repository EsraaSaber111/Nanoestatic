import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoestatic/components/default_button.dart';
import 'package:nanoestatic/components/doctor_serial.dart';
import 'package:nanoestatic/models/product_model.dart';
import 'package:nanoestatic/service/Api.dart';
import 'package:nanoestatic/size_config.dart';
import '../../../api_constants.dart';
import '../../../components/product_description.dart';
import '../../../constants.dart';
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
  int selectedImage = 0;
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
            Column(
          children: [
          SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
          tag:  snapshot.data.product.productImages.toString(),
          child: snapshot.data.product.productImages.isEmpty?
          Image.network('${imageURl+ snapshot.data.product.mainImage}'):
          Image.network('${imageURl+ snapshot.data.product.productImages[selectedImage].imageName}'),
          ),
          ),
          ),
          // SizedBox(height: getProportionateScreenWidth(20)),
            snapshot.data.product.productImages.isEmpty?Container(): Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ...List.generate(snapshot.data.product.productImages.length,
          (index) => buildSmallProductPreview(index,snapshot.data.product.productImages)),
          ],
          )
          ],
          ),

           //  snapshot.data.product.productImages==null?
           // ProductImages(snapshot.data.product.productImages),
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

  GestureDetector buildSmallProductPreview(int index,List<Product_images> imgs) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child:Image.network('${imageURl+imgs[index].imageName}'),
      ),
    );
  }
}

