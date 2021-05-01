import 'package:flutter/material.dart';
import 'package:shop_app/screens/allproducts/products_screen.dart';
import 'package:shop_app/screens/categories/categories_screen.dart';
import 'package:shop_app/screens/contact_us/ContactUs.dart';
import 'package:shop_app/screens/courses/CourseScreen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/inquiry/inquiry_screen.dart';
import 'package:shop_app/screens/offers/offers_screen.dart';
import 'package:shop_app/screens/product_serial/product_serial_screen.dart';
class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/download.png"),
                    fit: BoxFit.fitWidth)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Container()])),
        ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
            }),
        ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text('products'),
            onTap: () {
              Navigator.pushNamed(
                  context,
                  CategoriesScreen.routeName);
            }),
        ListTile(
            leading: Icon(Icons.label_important),
            title: Text('offers'),
            onTap: () {
              // Navigator.pushNamed(
              //     context,
              //     OfferScreen.routeName);

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OfferScreen()));
            }),
        ListTile(
            leading: Icon(Icons.laptop),
            title: Text('courses'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseScreen()));
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => AllCourses()));
            }),
        ListTile(
            leading: Icon(Icons.search),
            title: Text('Product Serial'),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductSerialScreen()));
            }),
        ListTile(
            leading: Icon(Icons.group_sharp),
            title: Text('about us'),
            onTap: () {
              // Navigator.pushNamed(context, '/settings');
            }),
        ListTile(
            leading: Icon(Icons.call),
            title: Text('contact us'),
            onTap: () {

                Navigator.pushNamed(
                    context,
                    ContactUs.routeName);
            }),
        ListTile(
            leading: Icon(
              Icons.error,
              color: Colors.red,
            ),
            title: Text('inquiry'),
            onTap: () {

              // Navigator.pushNamed(
              //     context,
              //     InquiryScreen.routeName);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => InquiryScreen()));

              // Navigator.pushNamed(context, '/settings');
            }),
      ],
    );
  }
}