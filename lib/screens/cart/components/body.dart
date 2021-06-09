// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shop_app/Provider/provider.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/models/Cart.dart';
//
// import '../../../dphelper.dart';
// import '../../../size_config.dart';
// import 'cart_card.dart';
//
// class Body extends StatefulWidget {
//   @override
//   _BodyState createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//   SQL_Helper helper = SQL_Helper();
//  List<ProductCart> carts;
//
//   @override
//   void initState() {
//     setState(() {
//        helper.getDataList().then((value) {
//          setState(() {
//            carts=value;
//          });
//        });
//       helper.getDataList().then((items) => SharedPreferences.getInstance().then((value) => value.setInt('length',items.length)));
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeColor = Provider.of<Provider_control>(context);
//
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: carts==null?Center(child: CircularProgressIndicator(),):ListView.builder(
//     itemCount: carts.length,
//       itemBuilder: (context, index) => Padding(
//         padding: EdgeInsets.symmetric(vertical: 10),
//         child: Dismissible(
//           key: UniqueKey(),
//           direction: DismissDirection.endToStart,
//           onDismissed: (direction) {
//             setState(() {
//               helper
//                   .deleteCart(carts[index].id)
//                   .whenComplete(() {
//                 print("deleted");
//
//                   helper.getDataList().then((value) {
//                     setState(() {
//                       carts=value;
//                     });
//                   });
//
//
//                 helper.getCount().then((value) {setState(() {
//                   themeColor.setCount(value);
//                 });});
//               });
//             });
//           },
//           background: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               color: Color(0xFFFFE6E6),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               children: [
//                 Spacer(),
//                 SvgPicture.asset("assets/icons/Trash.svg"),
//               ],
//             ),
//           ),
//           child: CartCard(carts[index]),
//         ),
//       ),
//     )
//     );
//   }
// }
