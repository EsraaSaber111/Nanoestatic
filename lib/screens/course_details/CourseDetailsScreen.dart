import 'package:flutter/material.dart';

import 'package:nanoestatic/components/course_description.dart';
import 'package:nanoestatic/components/default_button.dart';
import 'package:nanoestatic/models/course_model.dart';

import 'package:nanoestatic/screens/complete_order2/complete_order.dart';

import 'package:nanoestatic/screens/details/components/top_rounded_container.dart';

import 'package:nanoestatic/service/CoursesApi.dart';

import '../../api_constants.dart';
import '../../size_config.dart';


class CourseDetailsScreen extends StatefulWidget {
  String id;
  CourseDetailsScreen(this.id);
  static String routeName = "/coursedetails";
  Course_Model course;



  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
   getdata(){
    CoursesApi.getcoursedetails(widget.id)
        .then((value) {
      setState(() {
        widget.course = value;
      });
    print(widget.id);

    });
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        // appBar: CustomAppBar(rating: agrs.product.rating),
        // body: Body(courseId));
        body: SafeArea(
          child: widget.course==null? Container() : ListView(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(250),
                      width: getProportionateScreenWidth(200),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Hero(
                          child: Image.network(
                              '${imageURl + widget.course.course.mainImage}'),
                          tag: UniqueKey(),

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
                          CourseDescription(widget.course.course),
                          Text(
                            'Specs',
                            style: TextStyle(fontWeight: FontWeight.w400),
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
                                      text: "Apply Course",
                                      press: () {
                                        Navigator.pushNamed(
                                            context, CompleteOrder2.routeName);
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
                ),
        ));
  }
}
