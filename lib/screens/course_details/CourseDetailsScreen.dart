import 'package:flutter/material.dart';
import 'package:shop_app/components/course_description.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/product_description.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/course_model.dart';
import 'package:shop_app/screens/complete_order/complete_order.dart';
import 'package:shop_app/screens/complete_order2/complete_order.dart';
import 'package:shop_app/screens/details/components/custom_app_bar.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';
import 'package:shop_app/service/Api.dart';

import '../../api_constants.dart';
import '../../size_config.dart';
import 'components/body.dart';

class CourseDetailsScreen extends StatefulWidget {
  int courseId;
  CourseDetailsScreen(this.courseId);
  static String routeName = "/coursedetails";
  Future<Course_Model>course;

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.course=Api.getcoursedetails(widget.courseId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        // appBar: CustomAppBar(rating: agrs.product.rating),
        // body: Body(courseId));
        body: SafeArea(
          child: FutureBuilder<Course_Model>(
              future: widget.course,
              builder: (_,snapshot) {
                if(snapshot.hasData){
                  return ListView(
                    children: [
                      Container(height: getProportionateScreenHeight(250),
                        width: getProportionateScreenWidth(200),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Hero(
                            child: Image.network('${imageURl+snapshot.data.course.mainImage}'),
                            tag: snapshot.data.course.id.toString(),

                            // child: Image.asset(product.img,fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      // ),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Column(
                          children: [
                            /// todo:has to edit this
                            CourseDescription(snapshot.data.course),
                            Text('Specs',style: TextStyle(fontWeight: FontWeight.w400),),
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
                                        text: "Apply Course",
                                        press: () {
                                          Navigator.pushNamed(
                                              context,
                                              CompleteOrder2.routeName);

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


              })
          ,
        )
    );
  }

}
