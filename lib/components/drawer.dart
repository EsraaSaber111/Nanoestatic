import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/screens/about_us/AboutUs.dart';
import 'package:shop_app/screens/categories/categories_screen.dart';
import 'package:shop_app/screens/contact_us/ContactUs.dart';
import 'package:shop_app/screens/courses/CourseScreen.dart';
import 'package:shop_app/screens/inquiry/inquiry_screen.dart';
import 'package:shop_app/screens/mainpage/mainpagescreen.dart';
import 'package:shop_app/screens/member_serial/member_serial_screen.dart';
import 'package:shop_app/screens/offers/offers_screen.dart';
import 'package:shop_app/screens/product_serial/product_serial_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

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
              Navigator.pop(context);
Navigator.pushReplacementNamed(context, MainPage.routeName);
             // Navigator.of(context).pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
            }),
        ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title:Text(getTranslated(context, 'products')),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil(CategoriesScreen.routeName, ModalRoute.withName(MainPage.routeName));
//Navigator.of(context).pushReplacementNamed(CategoriesScreen.routeName);
            }),
        ListTile(
            leading: Icon(Icons.label_important),
            title: Text(getTranslated(context, 'offers')),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil(OfferScreen.routeName, ModalRoute.withName(MainPage.routeName));
              //Navigator.of(context).pushReplacementNamed(OfferScreen.routeName);
            }),
        ListTile(
            leading: Icon(Icons.laptop),
            title:Text(getTranslated(context, 'courses')),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil(CourseScreen.routeName, ModalRoute.withName(MainPage.routeName));

             // Navigator.of(context).pushReplacementNamed(CourseScreen.routeName);
            }),
        ListTile(
            leading: Icon(Icons.search),
            title: Text('Product Serial'),
            onTap: () {
              Navigator.pop(context);
               Navigator.of(context).pushNamedAndRemoveUntil(ProductSerialScreen.routeName, ModalRoute.withName(MainPage.routeName));
            }),
        ListTile(
            leading: Icon(Icons.person_search),
            title: Text('Member Serial'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil(MemberSerialScreen.routeName, ModalRoute.withName(MainPage.routeName));
            }),
        ListTile(
            leading: Icon(Icons.group_sharp),
            title: Text(getTranslated(context, 'about_us')),
            onTap: () {
              Navigator.pop(context);
             Navigator.of(context).pushNamedAndRemoveUntil(AboutUs.routeName, ModalRoute.withName(MainPage.routeName));

            }),
        ListTile(
            leading: Icon(Icons.call),
            title: Text(getTranslated(context, 'contact_us')),
            onTap: () {
              Navigator.pop(context);
             Navigator.of(context).pushNamedAndRemoveUntil(Contact.routeName, ModalRoute.withName(MainPage.routeName));

            }),
        ListTile(
            leading: Icon(
              Icons.error,
              color: Colors.red,
            ),
            title: Text(getTranslated(context, 'inquiry')),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamedAndRemoveUntil(InquiryScreen.routeName, ModalRoute.withName(MainPage.routeName));

            }),
        ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
                SharedPreferences.getInstance().then((prefs) {
                  prefs.clear();
                  print(prefs.getString('user_token'));
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));

            }
            )



      ],
    );

  }


}