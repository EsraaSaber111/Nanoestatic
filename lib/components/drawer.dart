import 'package:flutter/material.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/screens/about_us/AboutUs.dart';
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
            title: Text(getTranslated(context, 'home_page')),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
            }),
        ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title:Text(getTranslated(context, 'products')),

            onTap: () {
              Navigator.pushNamed(
                  context,
                  CategoriesScreen.routeName);
            }),
        ListTile(
            leading: Icon(Icons.label_important),
            title: Text(getTranslated(context, 'offers')),
            onTap: () {
              Navigator.pushNamed(context, OfferScreen.routeName);
            }),
        ListTile(
            leading: Icon(Icons.laptop),
            title:Text(getTranslated(context, 'courses')),
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
            title: Text(getTranslated(context, 'about_us')),
            onTap: () {
              Navigator.pushNamed(
                  context,
                  AboutUs.routeName);
            }),
        ListTile(
            leading: Icon(Icons.call),
            title: Text(getTranslated(context, 'contact_us')),
            onTap: () {
                Navigator.pushNamed(
                    context,
                    Contact.routeName);
            }),
        ListTile(
            leading: Icon(
              Icons.error,
              color: Colors.red,
            ),
            title: Text(getTranslated(context, 'inquiry')),
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