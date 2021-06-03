// import 'package:flutter/material.dart';
// import 'package:shop_app/api_constants.dart';
// import 'package:shop_app/components/default_button.dart';
// import 'package:shop_app/models/Product.dart';
// import 'package:shop_app/models/course_model.dart';
// import 'package:shop_app/screens/complete_order/complete_order.dart';
// import 'package:shop_app/components/product_description.dart';
// import 'package:shop_app/screens/details/components/top_rounded_container.dart';
// import 'package:shop_app/service/Api.dart';
// import '../../../size_config.dart';
//
// class Body extends StatefulWidget {
//
//   int courseId;
//   Body(this.courseId);
//
//   @override
//   _BodyState createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//   Future<Course_Model>course;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    course=Api.getcoursedetails(widget.courseId);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Course_Model>(
//       future: course,
//       builder: (_,snapshot) {
//         if(snapshot.hasData){
//           return ListView(
//             children: [
//               Container(height: getProportionateScreenHeight(250),
//                 width: getProportionateScreenWidth(200),
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: Hero(
//                     child: Image.network('${imageURl+snapshot.data.course.mainImage}'),
//                     tag: snapshot.data.course.id.toString(),
//
//                    // child: Image.asset(product.img,fit: BoxFit.fitWidth,
//                     ),
//                   ),
//                 ),
//              // ),
//               TopRoundedContainer(
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     /// todo:has to edit this
//                     ProductDescription(snapshot.data.course),
//                     Text('Specs',style: TextStyle(fontWeight: FontWeight.w400),),
//                     TopRoundedContainer(
//                       color: Color(0xFFF6F7F9),
//                       child: Column(
//                         children: [
//                           //   Price(product: product),
//                           TopRoundedContainer(
//                             color: Colors.white,
//                             child: Padding(
//                               padding: EdgeInsets.only(
//                                 left: SizeConfig.screenWidth * 0.15,
//                                 right: SizeConfig.screenWidth * 0.15,
//                                 bottom: getProportionateScreenWidth(40),
//                                 top: getProportionateScreenWidth(15),
//                               ),
//                               child: DefaultButton(
//                                 text: "Apply Course",
//                                 press: () {
//                                   Navigator.pushNamed(
//                                       context,
//                                       CompleteOrder.routeName);
//
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//       }else if(snapshot.connectionState==ConnectionState.waiting){
//           return Center(child: CircularProgressIndicator(),);
//         }
//         else{
//           return Center(child: Text('error'),);
//         }
//
//
//   });
//   }
// }
//
//
